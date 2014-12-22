//must have a blank option one for question of type dropdown

standard('qTypes',['','Drop Down', 'Multidrop-down', 'Number Fillin', 'Essay', 'Code']);

standard('qTypes2',['','dropdowns', 'multidropdowns', 'numfillins', 'essays', 'codes']);
standard('correct',['Correct','Incorrect']);
standard('incorrect',['Incorrect','Correct']);


quiz({qList:[
  
  question({
    type:'dropdown',
    qHTML:'Type of Question:',
    ansrL:choices['qTypes'],
    pHold:'Choose a type...',
    hideL:choices['qTypes2']
    ,qID:"questionType"
  }),
  question({type:'essay',qHTML:'Question Text:',rows:3,cols:30,pHold:'Your text here...',qID:"questionHTML"}),
  questionSet({class:'dropdowns multidropdowns',qList:[
    question({type:'essay',qHTML:'Placeholder Text:',rows:3,cols:30,pHold:'Your text here...',qID:"placeholderText"}),
    question({type:'html',HTML:'Choices:'}),
    question({type:'multiquestion',qHTML:'',qArry:[
      question({type:'essay',rows:3,cols:30,pHold:'Your text here...',qID:"choices:1"}),
      question({type:'dropdown',qHTML:'',ansrL:choices['correct'],qID:"correct:1"})
    ]}),
    question({type:'multiquestion',qHTML:'',qArry:[
      question({type:'essay',rows:3,cols:30,pHold:'Your text here...',qID:"choices:2"}),
      question({type:'dropdown',qHTML:'',ansrL:choices['incorrect'],qID:"correct:2"})
    ]}),
    question({type:'multiquestion',qHTML:'',qArry:[
      question({type:'essay',rows:3,cols:30,pHold:'Your text here...',qID:"choices:3"}),
      question({type:'dropdown',qHTML:'',ansrL:choices['incorrect'],qID:"correct:3"})
    ]}),
  question({type:'html',HTML:'<br>'}),
    question({type:'addchoicesbutton'}),
    question({type:'removechoicesbutton'})
  ]}),
  
  questionSet({class:'codes',qList:[
    question({type:'essay',qHTML:'Base Code:',rows:3,cols:30,pHold:'Your base code here...',qID:"baseCode"})
  ]}),
  questionSet({class:'numfillins essays',qList:[
    question({type:'essay',qHTML:'Placeholder Text:',rows:3,cols:30,pHold:'Your placeholder text here...',qID:"placeholderText"})
  ]})
  
  ],opts:{submit:"Save Question", timed:false}});
