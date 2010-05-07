package commonconsensus.events {
    import flash.events.Event;
    
    /**
     * This custom Event class adds an XML task property to a
     * basic Event.
     */
    public class TaskEvent extends Event {
        /**
         * The TaskEvent type for the create action.
         */
        public static const TASK_CREATE:String = "taskCreate";
    
        /**
         * The task being affected.
         */
        public var task:XML;
    
        /**
         * @param type the type of the event
         * (TaskEvent.TASK_CREATE, etc)
         * @param task the XML of the task being affected
         */
        public function TaskEvent(type:String, task:XML) {
            super(type);
            this.task = task;
        }
    }
}