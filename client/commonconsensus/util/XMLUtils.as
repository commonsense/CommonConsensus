package commonconsensus.util {      
    public class XMLUtils {
        /**
         * Return true if the toString() is "true", false
         * otherwise. This is necessary since Boolean("false")
         * is true.
         */
        public static function xmlListToBoolean(
        xmlList:XMLList):Boolean {
            return xmlList.toString() == "true";
        }
    }
}