import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    // Add event listener for close modal events from dynamically loaded content
    this.element.addEventListener('click', this.handleModalClick.bind(this))
    // Listen for turbo frame loads
    this.element.addEventListener('turbo:frame-load', this.handleFrameLoad.bind(this))
  }

  disconnect() {
    this.element.removeEventListener('click', this.handleModalClick.bind(this))
    this.element.removeEventListener('turbo:frame-load', this.handleFrameLoad.bind(this))
  }

  openModal(event) {
    // This will be triggered when the link is clicked, but the actual loading is handled by Turbo
    // The modal will be shown when the frame loads
  }

  closeModal() {
    this.modalTarget.classList.add('hidden')
    this.modalTarget.classList.remove('flex')
    // Clear modal content by replacing the turbo frame
    const modalFrame = document.getElementById('modal_frame')
    modalFrame.innerHTML = ''
  }

  clickOutside(event) {
    if (event.target === this.modalTarget) {
      this.closeModal()
    }
  }

  handleModalClick(event) {
    // Check if the clicked element has the data-action attribute for closing modal
    if (event.target.matches('[data-action*="shop#closeModal"]')) {
      event.preventDefault()
      this.closeModal()
    }
  }

  handleFrameLoad(event) {
    // Show modal when turbo frame loads content, hide when cleared
    if (event.target.id === 'modal_frame') {
      if (event.target.innerHTML.trim() !== '') {
        this.modalTarget.classList.remove('hidden')
        this.modalTarget.classList.add('flex')
      } else {
        this.modalTarget.classList.add('hidden')
        this.modalTarget.classList.remove('flex')
      }
    }
  }
}