import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['commentsFields'];

  connect() {
    console.log('ClientFields controller connected');
  }

  async loadCommentFields(event) {
    event.preventDefault();
    // const niu_id = this.commentsFieldsTarget.id
    const response = await fetch('comment_new');
    var content = await response.text();
    var content = content.replace(/NEW_RECORD/g, new Date().valueOf())
    console.log(content);
    this.commentsFieldsTarget.insertAdjacentHTML('beforeend', content);
  }

  async loadNewCommentFields(event) {
    event.preventDefault();
    // const niu_id = this.commentsFieldsTarget.id
    const response = await fetch('comment_add');
    var content = await response.text();
    var content = content.replace(/NEW_RECORD/g, new Date().valueOf())
    console.log(content);
    this.commentsFieldsTarget.insertAdjacentHTML('beforeend', content);
  }

  remove_association(event) {
    event.preventDefault()
    let item = event.target.closest(".nested-fields")
    item.querySelector("input[name*='_destroy']").value = 1
    item.style.display = 'none'
  }
}