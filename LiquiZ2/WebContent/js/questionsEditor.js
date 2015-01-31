//must have a blank option one for question of type dropdown

standard('qTypes',['Single Response', 'Multiple Response', 'Number Fillin', 'Essay', 'Code']);

standard('qTypes2',['','dropdowns', 'multidropdowns', 'numfillins', 'essays', 'codes']);//link to problem
standard('correct',new solidText(['Correct','Incorrect']));
standard('incorrect',new solidText(['Incorrect','Correct']));
possibleRegexes=new solidText(["No Checking","Mass","Length"]);

quiz({qList:[
  
  //choose question type
  dropdown({
    HTML:'Type of Question:',
    ansrL:choices['qTypes'],
    pHold:'Choose a type...',
    hideL:choices['qTypes2']
    ,ID:"questionType"
  }),

  essay({HTML:'Question Text:',rows:3,cols:30,pHold:'Your text here...',ID:"questionHTML"}),
  
  //question type choice determines which questionSet is shown
  questionSet({class:'dropdowns multidropdowns',qList:[
    essay({HTML:'Placeholder Text:',rows:3,cols:30,pHold:'Your text here...',ID:"placeholderText"}),
    checkbox({HTML:'',ansrL:['is drop-down'],ID:"isDropDown"}),
    html({HTML:'Choices:'}),
    multiquestion({HTML:'',Arry:[
      essay({rows:3,cols:30,pHold:'Your text here...',ID:"choices-1"}),
      dropdown({HTML:'',ansrL:choices['correct'],ID:"correct-1"})
    ]}),
    multiquestion({HTML:'',Arry:[
      essay({rows:3,cols:30,pHold:'Your text here...',ID:"choices-2"}),
      dropdown({HTML:'',ansrL:choices['incorrect'],ID:"correct-2"})
    ]}),
    multiquestion({HTML:'',Arry:[
      essay({rows:3,cols:30,pHold:'Your text here...',ID:"choices-3"}),
      dropdown({HTML:'',ansrL:choices['incorrect'],ID:"correct-3"})
    ]}),
    html({HTML:'<br>'}),
    question({type:'addchoicesbutton'}),
    question({type:'removechoicesbutton'})
  ]}),
  
  questionSet({class:'codes',qList:[
    essay({HTML:'Base Code:',rows:3,cols:30,pHold:'Your base code here...',ID:"baseCode"})
  ]}),
  questionSet({class:'numfillins essays',qList:[
    dropdown({HTML:'Regex Pattern',ansrL:possibleRegexes,ID:"regexPattern"}),
    essay({HTML:'Placeholder Text:',rows:3,cols:30,pHold:'Your placeholder text here...',ID:"placeholderText"})
  ]})
  
  ],opts:{submit:"Save Question", isEditor:true, timed:false}});
