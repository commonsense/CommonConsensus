// LiveTree, version: 0.1
//
// Home page: http://www.epiphyte.ca/code/live_tree.html
//
// Copyright (c) 2005 Emanuel Borsboom
// 
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the 
// "Software"), to deal in the Software without restriction, including 
// without limitation the rights to use, copy, modify, merge, publish, 
// distribute, sublicense, and/or sell copies of the Software, and to permit
// persons to whom the Software is furnished to do so, subject to the 
// following conditions:
// 
// The above copyright notice and this permission notice shall be included
// in all copies or substantial portions of the Software.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
// OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN
// NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
// DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
// OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE
// USE OR OTHER DEALINGS IN THE SOFTWARE.

function LiveTree(id, options) {
	this.id = id;
	
	if (options == null) {
		options = {};
	}
	
	this.dataUrl = options.dataUrl;
	this.cssClass = options.cssClass;
	this.cssStyle = options.cssStyle;
	this.expandRootItem = (options.expandRootItem == null ? true : options.expandRootItem);	
	this.hideRootItem = (options.hideRootItem == null ? false : options.hideRootItem);
	this.rootItemId = options.rootItemId;
	this.expandItemOnClick = (options.expandItemOnClick == null ? true : options.expandItemOnClick);
	this.initialData = options.initialData;
	this.scroll = (options.scroll == null ? true : options.scroll);
	this.preloadItems = (options.preloadItems == null ? true : options.preloadItems);
	
	this.collapsedItemIconHtml = options.collapsedItemIconHtml;
	this.expandedItemIconHtml = options.expandedItemIconHtml;
	this.leafIconHtml = options.leafIconHtml;
	this.loadingIconHtml = options.loadingIconHtml;
	this.loadingTreeHtml = options.loadingTreeHtml;
	this.searchingHtml = options.searchingHtml;

	this.onClickItem = options.onClickItem;
	this.allowClickBranch = (options.allowClickBranch == null ? true : options.allowClickBranch);
	this.allowClickLeaf = (options.allowClickLeaf == null ? true : options.allowClickLeaf);
	this.onExpandItem = options.onExpandItem;
	this.onCollapseItem = options.onCollapseItem;
	this.onLoadItem = options.onLoadItem;
	
	this._root = {};
	this._itemsIndex = {};
	this._activeItemId = null;
	this._scrollToItemIdOnLoad = null;
	this._scrollToItemMustBeExpanded = false;
	this._searchCount = 0;
	this._preloadCount = 0;
	this._updateItemDisplay = null;
}

LiveTree.prototype._markItemForUpdateDisplay = function (item) {
	var tree = this;
	// This is not very intelligent yet... basically if only one item needs to be updated, that's fine, otherwise the whole tree is updated.
	if (tree._updateItemDisplay == null) {
		tree._updateItemDisplay = item;
	} else if (tree._updateItemDisplay != item) {
		tree._updateItemDisplay = tree._root;
	}	
}

LiveTree.prototype._getClass = function (suffix) {
	if (suffix != "") {
		suffix = "_" + suffix;
	}
	result = 'live_tree' + suffix;
	if (this.cssClass != null) {
		result += ' ' + this.cssClass + suffix;
	}
	return result;
}

LiveTree.prototype._getCollapsedItemIconHtml = function () {
	if (this.collapsedItemIconHtml != null) {
		return this.collapsedItemIconHtml;
	} else {
		return '<img src="/images/live_tree_branch_collapsed_icon.gif" alt="&gt;" width="9" height="9" class="' + this._getClass("item_icon") + '" />';
	}
}

LiveTree.prototype._getExpandedItemIconHtml = function () {
	if (this.expandedItemIconHtml != null) {
		return this.expandedItemIconHtml;
	} else {
		return '<img src="/images/live_tree_branch_expanded_icon.gif" alt="v" width="9" height="9" class="' + this._getClass("item_icon") + '" />';
	}
}

LiveTree.prototype._getLeafIconHtml = function () {
	if (this.leafIconHtml != null) {
		return this.leafIconHtml;
	} else {
		return '<img src="/images/live_tree_leaf_icon.gif" alt=" " width="9" height="9" class="' + this._getClass("item_icon") + '" />';
	}
}

LiveTree.prototype._getLoadingIconHtml = function () {
	if (this.loadingIconHtml != null) {
		return this.loadingIconHtml;
	} else {
		return '<img src="/images/live_tree_loading_spinner.gif" alt="[loading]" width="10" height="10" class="' + this._getClass("loading_icon") + '" />';
	}
}

LiveTree.prototype._getLoadingTreeHtml = function () {
	if (this.loadingTreeHtml != null) {
		return this.loadingTreeHtml;
	} else {
		return '<span class="' + this._getClass("loading_tree") + '">' + this._getLoadingIconHtml() + 'Loading tree data&hellip;</span>';
	}
}

LiveTree.prototype._getSearchingHtml = function () {
	if (this.searchingHtml != null) {
		return this.searchingHtml;
	} else {
		return '<div class="' + this._getClass("searching") + '">' + this._getLoadingIconHtml() + 'Searching for item&hellip;</div>';
	}
}

LiveTree.prototype._addItem = function (item, parent) {
	// If this item ID was already loaded, copy its status from the old data
	var oldItem = this._itemsIndex[item.id];
	if (oldItem != null) {
		item.isLoading = oldItem.isLoading;
		item.isLoadingBackground = oldItem.isLoadingBackground;
		item.isExpanded = oldItem.isExpanded;
	}	
	this._itemsIndex[item.id] = item;

	// Add some extra properties
	item.isLeaf = !(item.children == null || item.children.length > 0);
	item.isLoaded = item.children != null;
	item.parent = parent;
	
	// Replace or add this item in the parent's list of children
	if (parent.children == null) {
		parent.children = [item];
	} else {
		var found = false;
		for (var i = 0; i < parent.children.length; i++) {
			if (parent.children[i].id == item.id) {
				parent.children[i] = item;
				found = true;
				break;
			}
		}
		if (!found) {
			parent.children[parent.children.length] = item;
		}
	}
	
	// Now add the item's children as well
	if (item.children != null) {
		for (var i = 0; i < item.children.length; i++) {
			this._addItem(item.children[i], item);
		}
	}
}

LiveTree.prototype._startPreloads = function (item) {
	var tree = this;
	if (!tree.preloadItems || tree._preloadCount > 0) {
		return false;
	}
	if (item == null) {
		item = tree._root;
	}
	//alert("startPreloads " + item.id);
	if (!item.isExpanded || item.isLoading) {
		return false;
	}
	var tailBranch = true;
	for (var i = 0; i < item.children.length; i++) {
		var child = item.children[i];
		if (!child.isLeaf && ( child.isLoaded || child.isLoading )) {
			tailBranch = false;
		}
	}
	var doLoad = false;
	if (tailBranch) {
		for (var i = 0; i < item.children.length; i++) {
			var child = item.children[i];
			if (!child.isLeaf) {
				if (!child.isLoaded && !child.isLoading) {
					//alert("setting loading for " + child.id);
					doLoad = true;
					child.isLoading = true;
					child.isLoadingBackground = true;
				}
			}
		}
	}
	var didLoad = false;
	if (doLoad) {
		//alert("preloading children of " + item.id);
		tree._preloadCount++;
		tree._requestItem(item.id, 3, tree._onPreloadItemReceived.bind(tree));	
		tree._markItemForUpdateDisplay(item);
		didLoad = true;
	} else {
		for (var i = 0; i < item.children.length; i++) {
			var child = item.children[i];
			if (!child.isLeaf && child.isLoaded) {
				if (tree._startPreloads(child)) {
					didLoad = true;
				}
			}
		}
	}

	return didLoad;
}

LiveTree.prototype._handleReceivedItem = function (item, requestOptions) {
	var tree = this;

	// Find item's parent
	var parent = null;
	if (requestOptions.includeParents) {
		// The response includes the desired item's parents, but we don't want to over-write
		// data that is already there (since it may include other children deeper down), so 
		// go down the tree until we find an item that hasn't been loaded before (or we get to the
		// requested item)
		var newParent = tree._getItem(item.id).parent;
		while (true) {
			// since we included parents, there should only be a single child with children, so find that one
			var child = null;
			for (var i = 0; i < item.children.length; i++) {
				if (item.children[i].children != null && item.children[i].children.length > 0) {
					if (child != null) {
						alert("LiveTree error: didn't expect multiple children with children while iterating through parents");
						return;
					}
					child = item.children[i];					
				}
			}
			if (child == null || tree._getItem(child.id) == null) {
				break;
			}
			newParent = item;
			item = child;
		}
		parent = tree._getItem(newParent.id);
	} else {
		// First, check if root is the parent
		if (tree._root.children == null) {
			// ... which is always the case if the root has no children, since that means nothing has been loaded yet
			parent = tree._root;
		} else {
			for (var i = 0; i < tree._root.children.length; i++) {
				if (item.id == tree._root.children[i].id) {
					parent = tree._root;
					break;
				}
			}
		}
		// Otherwise, it must have been loaded before, so get the old parent
		if (parent == null) {
			var oldItem = tree._itemsIndex[item.id];
			if (oldItem == null) {
				alert("LiveTree error: attempt to load item of unknown parentage");
				return false;
			}
			parent = oldItem.parent;
		}
	}
	
	// Now add the item to its parent
	tree._addItem(item, parent);
	//alert(ekb_inspect(tree._root));
	tree._markItemForUpdateDisplay(parent);
	
	if (tree.onLoadItem != null) {
		tree.onLoadItem(item);
	}
	return true;
}

LiveTree.prototype._onItemResponse = function (request, onItemCallback, requestOptions) {
	var tree = this;
	if (requestOptions.includeParents) {
		tree._searchCount--;
	}
	var item;
	try {
		eval("item = " + request.responseText);
	} catch (e) {
		alert("LiveTree error: bad items data from server: " + e);
		return;
	}
	var handled = tree._handleReceivedItem(item, requestOptions);
	if (handled) {
		onItemCallback(item, requestOptions);
	}	
}

LiveTree.prototype._requestItem = function (itemId, depth, onItemCallback, options) {
	var tree = this;	
	if (options == null) {
		options = {};
	}
	var url = tree.dataUrl;
	if (url == null) {
		alert("LiveTree error: no data URL provided");
		return false;
	}
	var requestOptions = new Object();
	var delim = "?";
	if (itemId != null) {
		requestOptions.itemId = itemId;
		url += delim + "item_id=" + itemId;		
		delim = "&";
	}
	if (depth != null) {
		requestOptions.depth = depth;
		url += delim + "depth=" + depth;
		delim = "&";
	}
	if (options.includeParents) {
		requestOptions.includeParents = true;
		requestOptions.rootItemId = tree.rootItemId;
		url += delim + "include_parents=1&root_item_id=" + tree.rootItemId;
		tree._searchCount++;
	}
	new Ajax.Request(url, {onComplete:function (request) { tree._onItemResponse(request, onItemCallback, requestOptions) }, evalScripts:true, asynchronous:true});
	return true;
}

LiveTree.prototype._onExpandItemReceived = function (item, requestOptions) {
	var tree = this;
	item.isLoading = false;
	tree._startPreloads();
	tree._updateDisplay();	
}

LiveTree.prototype._onPreloadItemReceived = function (item, requestOptions) {
	var tree = this;
	tree._preloadCount--;
	for (var i = 0; i < item.children.length; i++) {
		item.children[i].isLoading = false;		
	}
	tree._markItemForUpdateDisplay(item);
	tree._startPreloads();
	tree._updateDisplay();	
}

LiveTree.prototype._onClickExpand = function (item) {
	var tree = this;
	var expanded = tree._expandItem(item);
	tree._updateDisplay();	
	if (expanded) {
		tree.scrollToItem(item.id);
		if (item.isLoading) {
			tree._scrollToItemIdOnLoad = item.id;
			tree._scrollToItemMustBeExpanded = true;
		}
		if (tree.onExpandItem != null) {
			tree.onExpandItem(item);
		}
	}
}

LiveTree.prototype._onClickCollapse = function (item) {
	var tree = this;
	if (!item.isExpanded) {
		return;
	}
	item.isExpanded = false;
	tree._markItemForUpdateDisplay(item);
	tree._updateDisplay();	
	if (tree.onCollapseItem != null) {
		tree.onCollapseItem(item);
	}
}

LiveTree.prototype._onClickItem = function (item) {
	var tree = this;
	if (tree.expandItemOnClick && !item.isExpanded && !item.isLeaf) {
		tree._onClickExpand(item);		
	}
	if (tree.onClickItem != null && ((tree.allowClickLeaf && item.isLeaf) || (tree.allowClickBranch && !item.isLeaf))) {
		tree.onClickItem(item);
	}
	tree._updateDisplay();
}

LiveTree.prototype._getItem = function (itemId) {
	return this._itemsIndex[itemId];
}

LiveTree.prototype._getItemElement = function (itemId) {
	return $(this.id + "_item_" + itemId);
}

LiveTree.prototype._displayItem = function (item, isRoot) {
	var tree = this;
	var elem;
	if (isRoot) {
		elem  = $(tree.id + "_root");
	} else {
		elem = tree._getItemElement(item.id);
	}
	var html = '';
	if (!isRoot) {
		if (!item.isLeaf) {
			if (item.isExpanded) {
				html += '<a href="#" id="' + tree.id + '_branch_collapse_link_' + item.id + '" class="' + this._getClass("branch_collapse_link") + '">'; {
					html += tree._getExpandedItemIconHtml();
				} html += '</a>';
			} else {
				html += '<a href="#" id="' + tree.id + '_branch_expand_link_' + item.id + '" class="' + this._getClass("branch_expand_link") + '">'; {
					html += tree._getCollapsedItemIconHtml();
				} html += '</a>';
			}
			if (item.isLoading && !item.isLoadingBackground) {
				html += tree._getLoadingIconHtml();
			}
		} else {
			html += tree._getLeafIconHtml();
		}
		var item_link_exists = false;
		var extraNameClass = "";
		if (item.id == tree._activeItemId) {
			extraNameClass = " " + this._getClass("active_item_name");
		}
		var name_html = '<span id="' + tree.id + '_item_name_' + item.id + '" class="' + this._getClass("item_name") + extraNameClass + '">' + item.name + '</span>';
		if ((tree.onClickItem != null && ((tree.allowClickLeaf && item.isLeaf) || (tree.allowClickBranch && !item.isLeaf))) ||
				(tree.expandItemOnClick && !item.isLeaf && !item.isExpanded)) {
			name_html = '<a href="#" id="' + tree.id + '_item_link_' + item.id + '" class="' + this._getClass("item_link") + '">' + name_html + '</a>';
			item_link_exists = true;
		}
		//name_html = "(" + item.id + ") " + name_html;
		html += name_html;
		//if (item.isLoading && item.isLoadingBackground) {
		//	html += " " + tree._getLoadingIconHtml();
		//}
	}
	if (item.isExpanded && item.children != null) {
		var childrenListId;
		if (isRoot) {
			childrenListId = tree.id + '_children_list_root';
		} else {
			childrenListId = tree.id + '_children_list_' + item.id;
		}
		if (!isRoot) {
			html += '<ul id="' + childrenListId + '" class="' + this._getClass("branch") + '">';
		}
		for (var i = 0; i < item.children.length; i++) {
			var child = item.children[i];
			html += '<li id="' + tree.id + '_item_' + child.id + '" class="' + this._getClass("item") + '"></li>';
		}		
		if (!isRoot) {
			html += '</ul>';	
		}
	}
	elem.innerHTML = html;	
	if (!isRoot) {
		if (!item.isLeaf) {
			if (item.isExpanded) {
				$(tree.id + '_branch_collapse_link_' + item.id).onclick = function () { tree._onClickCollapse(item); return false }		
			} else {
				$(tree.id + '_branch_expand_link_' + item.id).onclick = function () { tree._onClickExpand(item); return false }
			}
		}
		if (item_link_exists) {
			$(tree.id + '_item_link_' + item.id).onclick = function() { tree._onClickItem(item); return false }
		}
	}
	if (item.isExpanded && item.children != null) {
		for (var i = 0; i < item.children.length; i++) {
			tree._displayItem(item.children[i], false);
		}
	}
}

LiveTree.prototype._checkScrollOnLoad = function () {
	var tree = this;
	if (tree._scrollToItemIdOnLoad == null) {
		return;
	}
	var item = tree._itemsIndex[tree._scrollToItemIdOnLoad];
	if (item == null) {
		return;
	}
	if (tree._scrollToItemMustBeExpanded) {
		if (item.isLoaded) {
			// The user may have collapsed the item while it was loading, so only scroll to it if it's still expanded.
			if (item.isExpanded) {
				tree.scrollToItem(item.id);
			}
			tree._scrollToItemIdOnLoad = null;
		}
	} else {
		tree.scrollToItem(item.id);
		tree._scrollToItemIdOnLoad = null;		
	}
}

LiveTree.prototype._updateDisplay = function () {
	var tree = this;
	if (tree._searchCount > 0) {
		Element.show(tree.id + "_searching");
	} else {
		Element.hide(tree.id + "_searching");
	}
	var updateItem = tree._updateItemDisplay;	
	if (updateItem != null) {
		tree._updateItemDisplay = null;
		var html = "";
		var isRoot = false;
		if (updateItem == tree._root || (tree.hideRootItem && updateItem == tree._root.children[0])) {
			if (tree.hideRootItem) {
				updateItem = tree._root.children[0];
			}				
			isRoot = true;
		}
		tree._displayItem(updateItem, isRoot);
	}
	tree._checkScrollOnLoad();
}

LiveTree.prototype._onInitialItemReceived = function () {
	var tree = this;
	this.rootItemId = tree._root.children[0].id;
	if (tree.hideRootItem) {
		//tree._root = tree._root.children[0];
		tree._expandItem(tree._root.children[0]);
	} else if (tree.expandRootItem) {
		tree._expandItem(tree._root.children[0]);
	}
	tree._root.isExpanded = true;
	tree._markItemForUpdateDisplay(tree._root);
	tree._startPreloads();	
}

LiveTree.prototype._getElementPosition = function (destinationLink) {
	// borrowed from http://www.sitepoint.com/print/scroll-smoothly-javascript
	var destx = destinationLink.offsetLeft;  
	var desty = destinationLink.offsetTop;
	var thisNode = destinationLink;
	while (thisNode.offsetParent &&  
			(thisNode.offsetParent != document.body)) {
		thisNode = thisNode.offsetParent;
		destx += thisNode.offsetLeft;
		desty += thisNode.offsetTop;
	}
	return { x: destx, y: desty }
}

LiveTree.prototype._scrollTo = function (top) {
	var tree = this;
	if (!tree.scroll) {
		return;
	}
	var containerElem = $(tree.id);
	containerElem.scrollTop = top;
}

LiveTree.prototype.scrollToItem = function (itemId) {
	var tree = this;
	if (!tree.scroll) {
		return;
	}
	var itemElem = tree._getItemElement(itemId);
	if (itemElem == null) {
		return;
	}
	var containerElem = $(tree.id);
	var itemPos = tree._getElementPosition(itemElem);
	var containerPos = tree._getElementPosition(containerElem);
	var itemTop = itemPos.y - containerPos.y;
	var containerHeight = containerElem.offsetHeight - 35; //HACK: adjust for space used by scrollbars and other decoration
	if (itemTop + itemElem.offsetHeight > containerElem.scrollTop + containerHeight ||
			itemTop < containerElem.scrollTop) {
		// item is currently not entirely visible
		if (itemElem.offsetHeight > containerHeight) {
			// item is too big to fit, so scroll to the top
			tree._scrollTo(itemTop);
		} else {
			if (itemTop < containerElem.scrollTop + containerHeight) {
				// item is partially onscreen (the top is showing), so put whole item at bottom
				tree._scrollTo(itemTop + itemElem.offsetHeight - containerHeight);
			} else {
				// item is entirely offscreen, so center it
				tree._scrollTo(itemTop - containerHeight/2 + itemElem.offsetHeight/2);
			}
		}
	}
	tree._scrollToItemOnLoad = null;
}

LiveTree.prototype._expandItem = function (item) {
	var tree = this;
	
	// Make sure all item's parents are expanded as well
	var didExpand = false;
	var parent = item.parent;
	while (parent != tree._root && parent != null) {
		if (!parent.isExpanded) {
			parent.isExpanded = true;
			tree._markItemForUpdateDisplay(parent);
			didExpand = true;
		}
		parent = parent.parent;
	}	

	// Expand the selected item
	var needToLoad = false;
	if (!item.isExpanded) {
		needToLoad = (item.children == null && !item.isLoading);
		if (needToLoad) {
			item.isLoading = true;
		}
		item.isLoadingBackground = false;
		item.isExpanded = true;
		tree._markItemForUpdateDisplay(item);
		didExpand = true;
	}
	
	// If the item has not loaded, load it now
	if (needToLoad) {
		tree._requestItem(item.id, 2, tree._onExpandItemReceived.bind(tree));	
	}	

	tree._startPreloads();	
	return didExpand;
}

LiveTree.prototype._onExpandItemParentsReceived = function (item, requestOptions) {
	var tree = this;
	var requestedItem = tree._getItem(requestOptions.itemId);
	this._expandItem(requestedItem);
	tree._startPreloads();
	tree._updateDisplay();	
}

LiveTree.prototype.expandItem = function (itemId) {
	var tree = this;
	var item = tree._getItem(itemId);
	var search = false;
	if (item == null) {
		tree._requestItem(itemId, 2, tree._onExpandItemParentsReceived.bind(tree), { includeParents: true });
		search = true;
	} else {
		this._expandItem(this._itemsIndex[itemId]);
	}
	tree._updateDisplay();
	if (search) {
		tree._scrollTo(0);
		tree._scrollToItemIdOnLoad = itemId;		
		tree._scrollToItemMustBeExpanded = false;
	} else {
		tree.scrollToItem(itemId);
	}
}

LiveTree.prototype._onExpandParentsOfItemReceived = function (item, requestOptions) {
	var tree = this;
	var requestedItem = tree._getItem(requestOptions.itemId);
	tree._expandItem(requestedItem.parent);
	tree._startPreloads();
	tree._updateDisplay();	
}

LiveTree.prototype.expandParentsOfItem = function (itemId) {
	var tree = this;
	var item = tree._getItem(itemId);
	var search = false;
	if (item == null) {
		tree._requestItem(itemId, 1, tree._onExpandParentsOfItemReceived.bind(tree), { includeParents: true });
		search = true;
	} else {
		tree._expandItem(item.parent);
	}
	tree._updateDisplay();
	if (search) {
		tree._scrollTo(0);
		tree._scrollToItemIdOnLoad = itemId;		
		tree._scrollToItemMustBeExpanded = false;
	} else {
		tree.scrollToItem(itemId);
	}
}

LiveTree.prototype.activateItem = function (itemId) {
	var tree = this;
	// un-highlight the old active item
	var oldElem = $(tree.id + '_item_name_' + tree._activeItemId);
	if (oldElem != null) {
		oldElem.className = tree._getClass("item_name");
	}
	// highlight the new active item
	var elem = $(tree.id + '_item_name_' + itemId);
	if (elem != null) {
		elem.className = tree._getClass("item_name") + " " + tree._getClass("active_item_name");
	}
	tree._activeItemId = itemId;
	tree.scrollToItem(itemId);
}

LiveTree.prototype.getHtml = function() {
	var tree = this;	
	var html = '';
	html += '<div id="' + tree.id + '" class="' + tree._getClass("") + '"';
	if (tree.cssStyle != null) {
		html += ' style="' + tree.cssStyle + '"';
	}
	html += '>';
	html += '<div id="' + tree.id + '_searching" style="display:none">' + tree._getSearchingHtml() + '</div>';
	html += '<ul id="' + tree.id + '_root" class="' + tree._getClass("root") + '">' + tree._getLoadingTreeHtml() + '</ul>'
	html += '</div>';
	return html;
}

LiveTree.prototype.start = function() {
	var tree = this;	
	if (tree.initialData != null) {
		var handled = tree._handleReceivedItem(tree.initialData, {});
		if (handled) {
			tree._onInitialItemReceived(tree.initialData);
		}
		tree._updateDisplay();
	} else {
		tree._requestItem(tree.rootItemId, tree.expandRootItem || tree.hideRootItem ? 2 : 1, tree._onInitialItemReceived.bind(tree));
	}
}

LiveTree.prototype.render = function () {
	var tree = this;	
	document.write(tree.getHtml());
	tree.start();
}
