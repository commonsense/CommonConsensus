package commonconsensus.events {
    import flash.events.Event;
    
    /**
     * This custom Event class adds an XML location property to
     * a basic Event.
     */
    public class LocationEvent extends Event {
        /**
         * The LocationEvent type for the create action.
         */
        public static const LOCATION_CREATE:String =
            "locationCreate";

        /**
         * The LocationEvent type for the update action.
         */
        public static const LOCATION_UPDATE:String =
            "locationUpdate";
    
        /**
         * The LocationEvent type for the delete action.
         */
        public static const LOCATION_DELETE:String =
            "locationDelete";

        /**
         * The location being affected.
         */
        public var location:XML;
    
        /**
         * @param type the type of the event
         * (LocationEvent.LOCATION_CREATE etc)
         * @param location the XML of the location being
         * affected
         */
        public function LocationEvent(type:String,
        location:XML) {
            super(type);
            this.location = location;
        }
    }
}