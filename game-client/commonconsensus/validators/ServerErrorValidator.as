package commonconsensus.validators {
    import commonconsensus.validators.ServerErrors;
    import mx.validators.Validator;
    import mx.validators.ValidationResult;

    public class ServerErrorValidator extends Validator {
        /**
         * These are the ServerErrors that apply specifically to
         * this ServerErrorValidator.
         */
        private var _serverErrors:ServerErrors;

        /**
         * The field of the ServerErrors we are interested in.
         */
        public var field:String;

        /**
         * The ServerErrors we are interested in.
         */
        public function set serverErrors(
        pServerErrors:ServerErrors):void {
            _serverErrors = pServerErrors;
            validate();
        }
        
        public function ServerErrorValidator() {
            field = ServerErrors.BASE;//default to being on BASE
            _serverErrors = null;
            super();
        }

        override protected function doValidation(value:Object):
        Array {
            return _serverErrors.getErrorsForField(field);
        }
    }
}