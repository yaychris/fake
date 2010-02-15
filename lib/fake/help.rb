module Fake
  HELP = <<-HELP
Fake is a wrapper for the Faker gem providing easy access to
dummy text and values from the command line. 

  Usage:
    fake [repetition] [command]

  Commands:
    sentence
    paragraph
    name
    phone number
    email

  Examples:
    fake name
    fake 1 sentence
    fake 2 paragraphs
    fake 10 phones
HELP
end
