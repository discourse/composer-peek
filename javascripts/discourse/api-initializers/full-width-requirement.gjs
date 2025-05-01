import icon from "discourse/helpers/d-icon";
import htmlSafe from "discourse/helpers/html-safe";
import { apiInitializer } from "discourse/lib/api";
import { i18n } from "discourse-i18n";

export default apiInitializer("1.8.0", (api) => {
  api.renderInOutlet(
    "below-site-header",
    <template>
      <div class="alert alert-info alert-peek-mode-dependency">
        {{icon "shield-halved"}}{{htmlSafe
          (i18n
            (themePrefix "warning")
            link="https://https://github.com/discourse/discourse-full-width-component"
          )
        }}
      </div>
    </template>
  );
});
