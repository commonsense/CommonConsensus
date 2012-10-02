package commonconsensus.events {
    import flash.events.Event;
    
    public class FlagQuestionEvent extends Event {
        public static const FLAG_QUESTION:String = "flagQuestion";

        public var game:Object;
		public var score:Object;
		
		
        public function FlagQuestionEvent(result:Object) {
            super(FLAG_QUESTION, true);
            this.game = result.game;
        }
    }
}