import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"


export default class extends Controller {
  connect() {
    this.typed = new Typed(this.element, {
      strings: ["Somewhere epic to get wasted in Barcelona", "Not a lame ass party place", "Millionaire boat parties", "private island to get shit housed with my friends"],
      typeSpeed: 30,
      loop: true
    });
  }
  stopTyping = () => {
    this.typed.stop();
    this.typed.reset();
    this.element.value = "";
  }
}
