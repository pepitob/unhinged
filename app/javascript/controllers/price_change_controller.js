import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="price-change"
export default class extends Controller {

  static targets = ["nights", "price", "pricePerNight"]

  changeNights(event) {
    const price = this.pricePerNightTarget.innerHTML
    const stay = event.target.value;
    const dates = stay.split(" to ");
    const start = Date.parse(dates[0]);
    const end = Date.parse(dates[1]);
    const nights = (end - start) / (1000*60*60*24);
    this.nightsTarget.innerHTML = `€ x ${nights} nights`
    this.priceTarget.innerHTML = `${price * nights} €`
  }
}
