import axios from 'axios'

$(document).ready(function () {
  const checkbox = $('.checkbox')

  const is_present = checkbox.data('is_present')
  checkbox.prop('checked', is_present)

  checkbox.change((e) => {
    const id = checkbox.data('id');
    axios.post(`/teacher/change-status`).then((response) => {
      console.log(response)
    })
  })
})
