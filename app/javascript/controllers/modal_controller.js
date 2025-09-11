import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["backdrop"]

  connect() {
    // Listen for turbo frame loads to show/hide modal
    this.element.addEventListener('turbo:frame-load', this.handleFrameLoad.bind(this))
  }

  disconnect() {
    this.element.removeEventListener('turbo:frame-load', this.handleFrameLoad.bind(this))
  }

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

  handleFrameLoad(event) {
    // Show modal when turbo frame loads content, hide when cleared
    if (event.target.id === 'modal_frame') {
      if (event.target.innerHTML.trim() !== '') {
        this.backdropTarget.classList.remove('hidden')
        this.backdropTarget.classList.add('flex')
      } else {
        this.backdropTarget.classList.add('hidden')
        this.backdropTarget.classList.remove('flex')
      }
    }
  }
}