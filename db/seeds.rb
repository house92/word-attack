require 'pry'

languages = {
  english: { name: 'English' },
  spanish: { name: 'Spanish' },
  german: { name: 'German' },
  japanese: { name: 'Japanese' }
}

languages.keys.each do |language|
  languages[language] = Language.find_or_create_by(name: languages[language][:name])
end

verbs_one = List.find_or_create_by(name: 'Verbs I', language: languages[:spanish])

words = [
  { text: 'aceptar', language: languages[:spanish], translations: [
    { text: 'to accept', language: languages[:english] }
  ] },
  { text: 'acompa\u00F1ar', language: languages[:spanish], translations: [
    { text: 'to accompany', language: languages[:english] }
  ] },
  { text: 'a\u00F1adir', language: languages[:spanish], translations: [
    { text: 'to add', language: languages[:english] }
  ] },
  { text: 'aconsejar', language: languages[:spanish], translations: [
    { text: 'to advise', language: languages[:english] }
  ] },
  { text: 'permitir', language: languages[:spanish], translations: [
    { text: 'to allow', language: languages[:english] }
  ] },
  { text: 'contestar', language: languages[:spanish], translations: [
    { text: 'to answer', language: languages[:english] },
    { text: 'to reply', language: languages[:english] }
  ] },
  { text: 'dirigirse a', language: languages[:spanish], translations: [
    { text: 'to apply to', language: languages[:english] }
  ] },
  { text: 'solicitar', language: languages[:spanish], translations: [
    { text: 'to apply to', language: languages[:english] }
  ] },
  { text: 'discutir', language: languages[:spanish], translations: [
    { text: 'to argue', language: languages[:english] }
  ] },
  { text: 'llegar', language: languages[:spanish], translations: [
    { text: 'to arrive', language: languages[:english] }
  ] },
  { text: 'preguntar', language: languages[:spanish], translations: [
    { text: 'to ask', language: languages[:english] }
  ] },
  { text: 'hacer una pregunta', language: languages[:spanish], translations: [
    { text: 'to ask a question', language: languages[:english] }
  ] },
  { text: 'pedir', language: languages[:spanish], translations: [
    { text: 'to ask for', language: languages[:english] }
  ] },
  { text: 'evitar', language: languages[:spanish], translations: [
    { text: 'to avoid', language: languages[:english] }
  ] },
  { text: 'ba\u00F1arse', language: languages[:spanish], translations: [
    { text: 'to bathe', language: languages[:english] }
  ] },
  { text: 'estar', language: languages[:spanish], translations: [
    { text: 'to be', language: languages[:english] }
  ] },
  { text: 'ser', language: languages[:spanish], translations: [
    { text: 'to be', language: languages[:english] }
  ] },
  { text: 'poder', language: languages[:spanish], translations: [
    { text: 'to be able to', language: languages[:english] }
  ] },
  { text: 'nacer', language: languages[:spanish], translations: [
    { text: 'to be born', language: languages[:english] }
  ] },
  { text: 'llamarse', language: languages[:spanish], translations: [
    { text: 'to be called', language: languages[:english] }
  ] },
  { text: 'tener cuidado', language: languages[:spanish], translations: [
    { text: 'to be careful', language: languages[:english] }
  ] },
  { text: 'tener calor', language: languages[:spanish], translations: [
    { text: 'to be hot', language: languages[:english] }
  ] },
  { text: 'tener fr\u00EDo', language: languages[:spanish], translations: [
    { text: 'to be cold', language: languages[:english] }
  ] },
  { text: 'tener hambre', language: languages[:spanish], translations: [
    { text: 'to be hungry', language: languages[:english] }
  ] },
  { text: 'tener prisa', language: languages[:spanish], translations: [
    { text: 'to be in a hurry', language: languages[:english] }
  ] },
  { text: 'interesarse en', language: languages[:spanish], translations: [
    { text: 'to be interested in', language: languages[:english] }
  ] },
  { text: 'tener ganas de', language: languages[:spanish], translations: [
    { text: 'to be keen to', language: languages[:english] }
  ] },
  { text: 'encontrarse', language: languages[:spanish], translations: [
    { text: 'to be located', language: languages[:english] }
  ] },
  { text: 'estar situado', language: languages[:spanish], translations: [
    { text: 'to be located', language: languages[:english] }
  ] },
  { text: 'tener suerte', language: languages[:spanish], translations: [
    { text: 'to be lucky', language: languages[:english] }
  ] },
  { text: 'tener sue\u00F1o', language: languages[:spanish], translations: [
    { text: 'to be tired', language: languages[:english] }
  ] }
]

words.each do |word_attrs|
  word = Word.find_by(word_attrs.except(:translations)) || Word.new(word_attrs.except(:translations))
  word.lists << verbs_one if word.language.name == 'Spanish'
  word.save! unless Word.find_by(word_attrs.except(:translations))
  word_attrs[:translations].each do |translation_attrs|
    translation = Word.find_or_create_by(translation_attrs)
    WordPair.find_or_create_by(word_ids: [word.id, translation.id])
  end
end

binding.pry
