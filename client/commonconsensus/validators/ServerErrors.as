package commonconsensus.validators {
    import mx.validators.Validator;
    import mx.validators.ValidationResult;

    public class ServerErrors {
        public static const BASE:String = ":base";
        
        /**
         * The errors on specific fields (base errors are on the
         * BASE). The keys are the field Strings; the values are
         * Arrays of errors.
         */
        private var _allErrors:Object;

        public function ServerErrors(errorsXML:XML) {
            _allErrors = {};
            for each (var error:XML in errorsXML.error) {
                var field:String = error.@field;
                if (field == null || field == "") {
                    field = BASE;
                }
                if (_allErrors[field] == null) {
                    _allErrors[field] =
                     [ createValidationResult(error.@message) ];
                } else {
                    var fieldErrors:Array = _allErrors[field];
                    fieldErrors.push(
                        createValidationResult(error.@message));
                }
            }
        }
        
        /**
         * Return an Array of the errors (just Strings) for the
         * field, an empty Array if none.
         */
        public function getErrorsForField(field:String):Array {
            return _allErrors[field] == null ?
                [] : _allErrors[field];
        }
        
        private function createValidationResult(message:String):
        ValidationResult {
            return new ValidationResult(
                true,
                "",
                "SERVER_VALIDATION_ERROR",
                message);
        }
    }
}