# 30 pts for part A
describe "juego_rpt" do
  # this is given for free in the outline
  it "should raise ErrorNumeroJugadores if there are not exactly two players [1 point]" do
    lambda { juego_rpt([ ["Allen", "T"] ]) }.should raise_error(ErrorNumeroJugadores)
  end

  it "should raise NoExisteMovida if there is some strategy that is not R, P, or T [4 points]" do
    lambda { juego_rpt([ ["Allen", "A"], ["Richard", "P"] ]) }.should raise_error(NoExisteMovida)
  end

  it "should return the correct winner in a simple RPT game with a clear winner [15 points]" do
    juego_rpt([ ["Dave", "P"], ["Armando", "T"] ])[0].should == "Armando"
    juego_rpt([ ["Richard", "R"], ["Michael", "P"] ])[0].should == "Michael"
    juego_rpt([ ["Richard", "T"], ["Allen", "R"] ])[0].should == "Allen"
  end

  it "should return the first player in the case of a tie [10 points]" do
    juego_rpt([ ["Allen", "P"], ["Richard", "P"] ])[0].should == "Allen"
    juego_rpt([ ["David", "T"], ["Omer", "T"] ])[0].should == "David"
    juego_rpt([ ["Dave", "R"], ["Armando", "R"] ])[0].should == "Dave"
  end
end

# 70 pts for part B
describe "torneo_rpt" do
  it "should still be able to handle the case where a tournament is just one game [10 points]" do
    tournament2 = [ [ "Armando", "P" ], [ "Dave", "T" ] ]
    torneo_rpt(tournament2)[0].should == "Dave"
  end

  it "should pass the example given in the homework of an 8-player tournament [5 points]" do
    tournament_ex = [
                     [
                      [ ["Armando", "P"], ["Dave", "T"] ],
                      [ ["Richard", "R"],  ["Michael", "T"] ],
                     ],
                     [
                      [ ["Allen", "T"], ["Omer", "P"] ],
                      [ ["David E.", "R"], ["Richard X.", "P"] ]
                     ]
                    ]
    torneo_rpt(tournament_ex)[0].should == "Richard"
  end

  it "should pass a basic test case of 8 players [15 points]" do
    tournament8 = [
                   [
                    [
                     [ "Player 1", "R" ], [ "Player 2", "T" ]
                    ],
                    [
                     [ "Player 3", "P" ], [ "Player 4", "T" ]
                    ]
                   ],
                   [
                    [
                     [ "Player 5", "P" ], [ "Player 6", "R" ]
                    ],
                    [
                     [ "Player 7", "T" ], [ "Player 8", "R" ]
                    ]
                   ]
                  ]
    torneo_rpt(tournament8)[0].should == "Player 5"
  end

  it "should return the correct winner in the cases of 16 and 32-man tournaments [40 points]" do
    tournament32 = [
                    [
                     [
                      [
                       [
                        [ "Player 1", "R" ], [ "Player 2", "T" ]
                       ],
                       [
                        [ "Player 3", "P" ], [ "Player 4", "T" ]
                       ]
                      ],
                      [
                       [
                        [ "Player 5", "P" ], [ "Player 6", "R" ]
                       ],
                       [
                        [ "Player 7", "T" ], [ "Player 8", "R" ]
                       ]
                      ]
                     ],

                     [
                      [
                       [
                        [ "Player 9", "P" ], [ "Player 10", "R" ]
                       ],
                       [
                        [ "Player 11", "T" ], [ "Player 12", "T" ]
                       ]
                      ],
                      [
                       [
                        [ "Player 13", "P" ], [ "Player 14", "T" ]
                       ],
                       [
                        [ "Player 15", "R" ], [ "Player 16", "P" ]
                       ]
                      ]
                     ]
                    ],
                    [
                     [
                      [
                       [
                        [ "i 1", "R" ], [ "i 2", "T" ]
                       ],
                       [
                        [ "i 3", "P" ], [ "i 4", "T" ]
                       ]
                      ],
                      [
                       [
                        [ "i 5", "P" ], [ "i 6", "R" ]
                       ],
                       [
                        [ "i 7", "T" ], [ "i 8", "R" ]
                       ]
                      ]
                     ],

                     [
                      [
                       [
                        [ "i 9", "P" ], [ "i 10", "R" ]
                       ],
                       [
                        [ "i 11", "T" ], [ "i 12", "T" ]
                       ]
                      ],
                      [
                       [
                        [ "i 13", "P" ], [ "i 14", "T" ]
                       ],
                       [
                        [ "i 15", "R" ], [ "i 16", "T" ]
                       ]
                      ]
                     ]
                    ]
                   ]

    tournament16 = [
                    [[[[ [ "Ax", "R" ], ["Bx", "P"] ],
                       [ [ "Cx", "P"], ["Dx", "T"] ]],
                      [[ [ "Ex", "R" ], ["Fx", "P"] ],
                       [ [ "Gx", "P"], ["Hx", "T"] ]]],
                     [[[ [ "Ax2", "R" ], ["Bx2", "P"] ],
                       [ [ "Cx2", "P"], ["Dx2", "T"] ]],
                      [[ [ "Ex2", "R" ], ["Fx2", "P"] ],
                       [ [ "Gx2", "P"], ["Hx2", "T"] ] ]]],

                    [[[[ [ "Ax3", "R" ], ["Bx3", "P"] ],
                       [ [ "Cx3", "P"], ["Dx3", "T"] ]],
                      [[ [ "Ex3", "R" ], ["Fx3", "P"] ],
                       [ [ "Gx3", "P"], ["Hx3", "T"] ]]],
                     [[[ [ "Ax4", "R" ], ["Bx4", "P"] ],
                       [ [ "Cx4", "P"], ["Dx4", "T"] ]],
                      [[ [ "Ex4", "R" ], ["Fx4", "P"] ],
                       [ [ "Gx4", "P"], ["Hx4", "T"] ]]]]
                   ]

    torneo_rpt(tournament16)[0].should == "Dx"
    torneo_rpt(tournament32)[0].should == "Player 11"
  end
end
