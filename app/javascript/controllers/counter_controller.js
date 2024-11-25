import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["label", "input"];

  connect() {
    console.log("connected");
  }

  increment() {
    const count = this.count;
    this.count = count + 1;
  }

  decrement() {
    const count = this.count;
    if (count <= 0) return;
    this.count = count - 1;
  }

  get count() {
    return parseInt(this.inputTarget.value);
  }

  set count(value) {
    this.labelTarget.innerHTML = value === 0 ? "Any" : value;
    this.inputTarget.value = value;
  }
}
