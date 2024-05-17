import Component from "@glimmer/component";
import { action } from "@ember/object";
import { tracked } from "@glimmer/tracking";
import DButton from "discourse/components/d-button";
import { service } from "@ember/service";
import bodyClass from "discourse/helpers/body-class";

export default class PeekModeToggle extends Component {
  @service composer;
  @tracked peekModeActive = localStorage.getItem("peekModeActive") === "true" || false;

  get bodyClassText() {
    return this.peekModeActive ? "peek-mode-active" : "";
  }

  @action
  togglePeekMode() {
    this.peekModeActive = !this.peekModeActive;
    localStorage.setItem("peekModeActive", this.peekModeActive);
    if (this.composer.showPreview) {
      this.composer.togglePreview();
    }
  }

  <template>
    {{bodyClass this.bodyClassText}}
    <DButton
    @action={{this.togglePeekMode}}
    @preventFocus={{true}}
    @icon="discourse-sidebar"
    @class="btn-mini-toggle no-text peek-mode-toggle btn-transparent"
    />
  </template>
}