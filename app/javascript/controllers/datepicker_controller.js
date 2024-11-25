import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  static values = {
    inline: Boolean

  }


  connect() {
    this.flatpickr = flatpickr(this.element, {
      inline: this.inlineValue
    })
  }
}
