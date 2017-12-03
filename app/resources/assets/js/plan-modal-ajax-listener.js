import axios from 'axios'

$(document).ready(function () {

    $('.js-button-modal').click(function () {
        const button = $(this);

        let id = button.data('id');
        let container = $('.js-plan-content');

        axios.post('/plans-by-teacher/' + id).then(response => {
            let teacher = response.data.teacher;
            let teacherName = teacher.first_name + " " + teacher.last_name;
            $('.js-teacher-name').html("\"" + teacherName + "\"");

            let tableBody = "";

            $.each(response.data.plans, (index, value) => {
                let str =
                    '<tr>' +
                        '<td>' + (index + 1) + '</td>' +
                        '<td>' + value.comment + '</td>' +
                        '<td>' + value.date_start + '</td>' +
                        '<td>' + value.date_end + '</td>' +
                    '</tr>';
                tableBody += str;
            });

            container.html(tableBody);
        })
    })
});