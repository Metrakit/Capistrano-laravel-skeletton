#
# Ask some questions
#

set :migrate_question, ask('the answer: do you want execute the migrations', 'no')
set :seed_question, ask('the answer: do you want seed the database', 'no')
set :migrate_p_question, ask('the answer: do you want execute the migrations from the packages', 'no')
set :seed_p_question, ask('the answer: do you want seeds the from the packages', 'no')