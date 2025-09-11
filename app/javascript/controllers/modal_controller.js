import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["backdrop"]

  close() {
    this.backdropTarget.classList.add('hidden')
    this.backdropTarget.classList.remove('flex')
    // Clear modal content by replacing the turbo frame
    const modalFrame = document.getElementById('modal_frame')
    modalFrame.innerHTML = ''
  }

  clickOutside(event) {
    if (event.target === this.backdropTarget) {
      this.close()
    }
  }
}
