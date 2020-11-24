% A simple course advisor system
% The user interface

% Initialization procedures
start:-
    consult('info.pl'),nl,
    menu(ID).

selectedMenu(ID, option):-
    write("Wrong option!", option),nl,
    menu(ID),!.

% Displays menu to user
menu(ID):-
    write("Hello, I'm your friendly chat bot, I'll guide you about admission process eligibility criteria, examiniation pattern, fee structure, seat allotment etc."),nl,
    write("For eligibility criteria, I'll ask questions on your education and grades so that I can tell you for what branches you are eligible."),nl,
    write("For application process, I'll ask questions on deadline, exam date, exam centers, special instructions, syllabus, types of questions asked, scholarship etc."),nl,
    write("For application status, I'll tell you about BITSAT score of you, different cut-offs, seat allocated to you."),nl,
    write("For admission, I'll tell you about fee structure, payment details, payment status and confirmation etc."),nl,
    write("To proceed, please select any option from below options."),nl,
    write("1 -> Eligibility criteria"),nl,
	write("2 -> Application process"),nl,
	write("3 -> Application status"),nl,
	write("4 -> Admission"),nl,
    write("5 -> Quit"),nl,
    write("> "),
    read(option),
    selectedMenu(ID, option),
    nl,
    save.

selectedMenu(ID, 1):-
    eligibilityCriteria(ID), !.

selectedMenu(ID, 2):-
    applicationProcess(ID), !.

selectedMenu(ID, 3):-
    applicationStatus(ID), !.

selectedMenu(ID, 4):-
    admission(ID), !.

selectedMenu(ID, 5):-
    write("Good bye, it was fun assisting you!"), nl,
    personDetails(ID, name), write(name),
    undo.
	
eligibilitycriteria(ID) :- 
    write("Elgibility for BE degree....."),nl,
    person(ID, name),
    write("What is your CGPA 12th Board Exam?""),nl,
    read(Cgpa),
    C is round(Cgpa),
    eligible(C, Branches),
    write(Name),write(","),
    printlist(Branches),
    assert(ec(ID, name, Cgpa, Branches)),nl,nl,nl,
    greeting(ID).
