# Project 5 Report
Won Seob Shin

49820153

## Cell Library Layout

### Function

This is a simple Fixed State Machine for an automated public transportation gate. The hardware only requires a sensor to detect NFC cards and software to know whether the card is valid or not. The software should compare the card's data and the database system to check whether the card pass is valid (active in the system) and whether it has enough balance. The machine then opens the door to valid pass holders and outputs to the software that an amount should be deducted through a signal, and show an error message if something is wrong to the user.

As an extension of Project 1 and 2, we now Place and Route the design as a cell using Encounter.

### Inputs & Outputs

![fsm block diagram](https://github.com/wonseobshin/402Project1-Simple-SkyTrain-Gate-FSM/blob/master/fsm.jpg)

#### Inputs

- clk : System clock
- rst : Reset
- nfc : Near field comminicator. this implies that a card has been tapped
- card_active : Whether the tapped card is registered as active
- fund_enough : Whether the card has enough funds
- maintenance : Maintenance flag (under maintenance[1] or active[0])
- monthly : Whether this card is a monthly pass

#### Outputs

- open : Open the door
- disp : Display. Show error messages or visual interface to users
- reduce : Reduce funds from card balance
- sound : Make a sound to give feedback to users

### Testing
![TB to FSM](https://github.com/wonseobshin/402Project1-Simple-SkyTrain-Gate-FSM/blob/master/DUT_diagram.jpg)

Since in Project 1 we have already connected and tested the design we know the desired outputs. With this knowledge if we make a testbench file on Virtuoso we can run the cell and get waves.

### Layout
![layout](https://github.com/wonseobshin/402Project5/blob/master/cadence_size.JPG)

The some of the input pins have been move to the top of the design in order to simplify and minimize the size.

### Waves
![wave diagram](https://github.com/wonseobshin/402Project1-Simple-SkyTrain-Gate-FSM/blob/master/wave.JPG)