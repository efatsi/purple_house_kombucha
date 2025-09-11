import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal"]

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
  }

  clickOutside(event) {
    if (event.target === this.modalTarget) {
      this.closeModal()
    }
  }
}