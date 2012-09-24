package commonconsensus.events {
    //import com.adobe.serialization.json.JSON;
	//import com.adobe.serialization.json.JSONDecoder;
    
    import flash.events.Event;
    
    public class LoginEvent extends Event {
        public static const LOGIN:String = "login";

        public var user:Object;
		public var game:Object;
		
		
        public function LoginEvent(result:String) {
            super(LOGIN, true);
			var o:Object = JSON.parse(result);
            this.user = o.user;// JSON.decode(o.user) as Object;
            this.game = o.game;
 
        }
    }
}