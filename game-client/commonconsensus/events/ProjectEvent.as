package commonconsensus.events {
    import flash.events.Event;
    
    /**
     * This custom Event class adds an XML project property to a
     * basic Event.
     */
    public class ProjectEvent extends Event {
        /**
         * The ProjectEvent type for the create action.
         */
        public static const PROJECT_CREATE:String =
            "projectCreate";
    
        /**
         * The ProjectEvent type for the update action.
         */
        public static const PROJECT_UPDATE:String =
            "projectUpdate";
    
        /**
         * The ProjectEvent type for the delete action.
         */
        public static const PROJECT_DELETE:String =
            "projectDelete";

        /**
         * The project being affected.
         */
        public var project:XML;
    
        /**
         * @param type the type of the event
         * (ProjectEvent.PROJECT_CREATE, etc)
         * @param project the XML of the project being affected
         */
        public function ProjectEvent(type:String, project:XML) {
            super(type);
            this.project = project;
        }
    }
}