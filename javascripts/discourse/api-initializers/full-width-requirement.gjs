import Component from "@glimmer/component";
import { htmlSafe } from "@ember/template";
import icon from "discourse/helpers/d-icon";
import { apiInitializer } from "discourse/lib/api";
import { i18n } from "discourse-i18n";

export default apiInitializer((api) => {
  api.renderInOutlet(
    "below-site-header",
    class extends Component {
      static shouldRender() {
        const currentUser = api.container.lookup("service:currentUser");
        const hasClass = document.querySelector(".full-width-enabled");

        return currentUser?.staff && !hasClass;
      }

      <template>
        <div class="alert alert-info alert-peek-mode-dependency">
          {{icon "shield-halved"}}{{htmlSafe
            (i18n
              (themePrefix "warning")
              link="https://github.com/discourse/discourse-full-width-component"
            )
          }}
        </div>
      </template>
    }
  );
});
