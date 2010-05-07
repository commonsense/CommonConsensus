package commonconsensus.validators {
    import mx.validators.Validator;
    import mx.validators.ValidationResult;

    public class PasswordConfirmationValidator
    extends Validator {
        /**
         * The password being compared to the confirmation.
         */
        public var password:String;
        
        public function PasswordConfirmationValidator() {
            super();
        }
        
        override protected function doValidation(
            passwordConfirmation:Object):Array
        {
            //We call base class doValidation() to get the
            //required logic.
            var results:Array =
                super.doValidation(passwordConfirmation);
            
            // Compare password and passwordConfirmation fields.
            if (password != passwordConfirmation) {
                results.push(
                    new ValidationResult(
                        true,
                        "password_confirmation",
                        "passwordDoesNotMatchConfirmation",
              "The password does not match the confirmation."));
            }            
            return results;
        }
    }
}