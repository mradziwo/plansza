A=ones(10,2);                               %żółte/1 pierwsze dwie kolumny
B=zeros(10,2);                              %niebieskie/0 ostatnie dwie kolumny
Board=cat (2, A, B);                        %połączenie kolumn w planszę
StartBoard=Board                            %wyświetlenie planszy początkowej

function Board_out=swap(Board, row, column_A, column_B)
    %Zwraca planszę po zamianie żetonów
    %Argumenty:
    %Board - plansza przed zamianą
    %row - wiersz w którym następuje zamiania
    %column_A - kolumna żetonu zamienianego
    %column_B - kolumna żetonu do zamiany
    token=Board(row, column_A);             %wartość żetonu zamienianego
    Board_out=Board;                        %inicjalizacja planszy do zwrotu
    Board_out(row, column_A)=Board(row, column_B);  %zamiana żetonu do zamiany
    Board_out(row, column_B)=token;                 %zamiana żetonu zamienianego
end

function count=countYellowOnRightSide(Board)
    %zwraca liczbę żółtych/1 żetonów po prawej stronie planszy
    %Argumenty:
    %Board - plansza
    count=0;                                %inicjalizacja licznika
    for row = 1:10                          %dla każdego wiersza
        for column = 3:4                    %dla kolumn z prawej strony
            count+=Board(row, column);      %zlicz żółte
        end
    end
end


for iteration = 1:5                         %1+4 = 5 iteracji
    for row = 1:10                          %dla każdego wiersza
        for column = 1:4                    %dla każdej kolumy
            swapIDX=randi(4);               %wylosuj kolumnę do zamiany
            fprintf('\n\nIteration: %d\nSwapping [%d, %d] with [%d, %d]\n',...
                iteration, row, ...
                column, row, swapIDX);      %opisz jaka zamiana ma mieć miejsce
            Board=swap(Board,row, ...
                column, swapIDX)            %zamień żetony i pokaż planszę po 
                                            %zamianie
            YellowOnRightSide=countYellowOnRightSide(Board)
                                            %zlicz żółte po prawej stronie i 
                                            %zaprezentuj wynik
        end
    end
end
