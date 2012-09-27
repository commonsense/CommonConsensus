package commonconsensus.util {
    public class DebugMessage {
        [Bindable]
        public var time:Date;

        [Bindable]
        public var message:String;

        public function DebugMessage(message:String) {
            time = new Date();
            this.message = message;
        }

        public function toString():String {
            return "[" + time + "] " + message;
        }
    }
}