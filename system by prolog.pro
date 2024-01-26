domains
lst=integer*
Database- students
student(integer,symbol,lst)

predicates
nondeterm action(char)
nondeterm run

clauses 

action('a'):- write("id of student :"), readint(A),not(student(A,_,_)),
	      write("name of student:"),readln(B),
	      
	      assertz(student(A,B,[1])).
action('a') :- write("student is already exist").


action('u'):-write("id of student :"), readint(A), 
	     retract(student(A,B,C)),
	     assert(student(A,B,[2,1])).

action('v') :- 
	       student(A,B,C),
	       write("ID= "), write(A), write(": Name= "), write(B), write(": Level= "), write(C , " \n"),
	       fail.
action('v').

action('o'):- write("id of student :"), readint(A),
	      student(A,B,C),
	      write("ID= "), write(A), write(": Name= "), write(B), write(": Level= "), write(C , " \n").

action('d'):-write("id of student :"), readint(A), 
	     retract(student(A,B,C)).
	    
action('d'):-write("student not exist :").

run:-  write("\nPlease Write Choice [ADD[a],UPDATE[u],VIEWALL[v],DISPLAY ONE[o],delete[d] \n"),
	
	readchar(X),write(X),nl,
	write("choice=",X,"\n"),
	action(X),
	run.
run.

goal
run.