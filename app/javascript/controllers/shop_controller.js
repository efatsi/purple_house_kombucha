import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

  connect() {
    // Add event listener for close modal events from dynamically loaded content
    this.element.addEventListener('click', this.handleModalClick.bind(this))
  }

  disconnect() {
    this.element.removeEventListener('click', this.handleModalClick.bind(this))
  }

  async openModal(event) {
    const flavorId = event.currentTarget.dataset.flavorId
    
    try {
      const response = await fetch(`/line_items/new?flavor_id=${flavorId}`, {
        method: 'GET',
        headers: {
          'Accept': 'text/html',
          'X-Requested-With': 'XMLHttpRequest'
        }
      })
      
      if (response.ok) {
        const html = await response.text()
        const modalContent = document.getElementById('modal_content')
        modalContent.innerHTML = html
        this.modalTarget.classList.remove('hidden')
        this.modalTarget.classList.add('flex')
      }
    } catch (error) {
      console.error('Error loading modal:', error)
    }
  }

  closeModal() {
    this.modalTarget.classList.add('hidden')
    this.modalTarget.classList.remove('flex')
    // Clear modal content
    const modalContent = document.getElementById('modal_content')
    modalContent.innerHTML = ''
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
}