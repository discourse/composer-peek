import { apiInitializer } from "discourse/lib/api";
import peekModeToggle from "../components/peek-mode-toggle";

export default apiInitializer((api) => {
  api.renderInOutlet("before-composer-toggles", peekModeToggle);
});
