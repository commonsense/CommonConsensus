package commonconsensus.events {
    import flash.events.Event;
    import com.adobe.serialization.json.JSON;
    
    public class FlagQuestionEvent extends Event {
        public static const FLAG_QUESTION:String = "flagQuestion";

        public var game:Object;
		public var score:Object;
		
		
        public function FlagQuestionEvent(result:Object) {
            super(FLAG_QUESTION, true);
			CommonConsensus.debug("in flag question event, result[score]"+result.game);
            this.game = JSON.decode(""+result.game) as Object;
            CommonConsensus.debug("in flag question event, result[score]"+this.game);
            this.score = result.score; //JSON.decode(""+result.score) as Object;
        }
    }
}