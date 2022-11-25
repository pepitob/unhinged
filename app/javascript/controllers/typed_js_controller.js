import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"


export default class extends Controller {

  connect() {
    // const audio = new Audio('https://www.computerhope.com/jargon/m/example.mp3');
    // audio.play();
    new Typed(this.element, {
      strings: ["Somewhere epic to get wasted in Barcelona", "Not a lame ass party place", "Millionaire boat parties", "private island to get shit housed with my friends"],
      typeSpeed: 30,
      loop: true
    })
  }
}
