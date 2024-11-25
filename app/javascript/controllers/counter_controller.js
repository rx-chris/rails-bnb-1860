import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["total"]

  connect() {
  }

  decrement(event) {
    event.stopPropagation();
    const value = parseInt(this.totalTarget.value);
    if (value > 0) { this.totalTarget.value -= 1 };

  }

  increment(event) {
    event.stopPropagation();
    const value = parseInt(this.totalTarget.value);
    this.totalTarget.value = value + 1;
  }


}
