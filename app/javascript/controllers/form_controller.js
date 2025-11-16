import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="form"
export default class extends Controller {
  targets = ["form"];

  connect() {
    console.log("connected");
  }

  submit() {
    this.formTarget.submit();
  }
}
