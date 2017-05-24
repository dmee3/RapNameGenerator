class Generator
  constructor: ->
    @last_names = [
      'the Chef', 'Digital', 'Wise',
      'Knight', 'Wrecka', 'the Genius',
      'the Zoo Keeper', 'the Monk', 'the Scientist',
      'the Disciple', 'the Darkman', 'Pellegrino',
      'the Ill Figure', 'Rocks The World', 'the Baptist'
    ]
    @first_names = [
      'Inspectah', 'Masta', 'Poppa',
      'Five Foot', 'Ghostface', 'Old Dirty'
    ]
    @transforms = [
      ((s) -> s.toUpperCase()[0]),
      ((s) -> s.toUpperCase().split('').join('.') + '.'),
      ((s) -> s.replace /s|S/g, '$$$$'),
      ((s) -> s)
    ]

  get_name: (submitted_name) ->
    structures = [
      @first_names.random() + ' {}',
      @first_names.random() + ' {} ' + @last_names.random(),
      '{} ' + @last_names.random()
    ]

    name = @transforms.random() submitted_name
    structures.random().replace '{}', name

Array.prototype.random = -> @[Math.floor(Math.random() * @.length)]

engine = new Generator

$('.response, .error').hide()
$('#enter').click ->
  $('.response, .error').hide()
  input = $('#user-input').val()
  if input.length > 0
    name = engine.get_name input
    $('.response').text name
    $('.response').show()
  else
    $('.error').show()
  true
