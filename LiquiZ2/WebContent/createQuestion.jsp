<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html"; charset="UTF-8">
        <title>CreateQuestions</title>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.0/jquery.min.js">
        </script>
        <script src="assets/js/func.js"></script>
    </head>
    <body>
    	 Choose your color for blank
         <select name="question_type" size="1" onchange="setColor(this)">
            <option value="default" selected>default</option>
            <option value="red">red</option>
            <option value="blue">blue</option>
            <option value="green">green</option>
        </select>
        <form method="GET" action="addQuestion">
            <div id="div_title" align="left">
                </br>
            
                Title  <input type="text" name="title">
                QuestionType
                <select name="question_type" size="1" onchange="changeQuestion(this)">
                    <option value="FillIn" selected>FillIn</option>
                    <option value="Essay" >Essay</option>        
                    <option value="Code" >Code</option>                 
                    <option value="MultiChoiceDropdown">MultiChoice-Dropdown</option>
                    <option value="MultiChoiceRadio">MultiChoice-Radio</option>
                    <option value="MultiAnswer">MultiAnswer</option>
                    
                </select>
                                
                </div>
            </div>
            </br>
            <div id="common_attribute" align="left">
                Level<input type="text" name="level" value="1">
                Points<input type="text" name="points" = value="1">
                Answer<input type="text" name="answer">   
            </div>
            </br>
                        
            <div>
            	Image Upload
				<input type="file" name = "image_src" id="image-input">
				<input type="button" value="Load Selected Image" id="load-image" />
				</br>
				
			</div>

			<div>
			    </br>
       			<img id="image-container"/>
    		</div>
    		
    		</br>
    		
    		<script>
    		(function(){

    		    var fileInput = document.getElementById('image-input');
    		    var image = document.getElementById('image-container');

    		    document.getElementById('load-image').addEventListener('click', function(){

    		    	var fileUrl = window.URL.createObjectURL(fileInput.files[0]);

    		        image.src = fileUrl;

    		    });

    		})();   

			</script>
			
			
           
			<div>
                Audio Upload
				<input type="file" name= "audio_src" id="audio-input">
				<input type="button" value="Load Selected Audio" id="load-audio" />
			
			</div>

			<div>
				</br>
       			<audio id="audio-container" controls></audio>
       			</br>
       			</br>
    		</div>
    		
    		<script>
    		(function(){

    		    var fileInput = document.getElementById('audio-input');
    		    var audio = document.getElementById('audio-container');

    		    document.getElementById('load-audio').addEventListener('click', function(){

    		    	var fileUrl = window.URL.createObjectURL(fileInput.files[0]);

    		        audio.src = fileUrl;

    		    });

    		})();   

			</script>
			
			 <div>
                Video Upload
				<input type="file" name= "video_src" id="video-input">
				<input type="button" value="Load Selected Video" id="load-video" />
			</div>

			<div>
				</br>
       			<video id="video-container" controls></video>
       			</br>
       			</br>
    		</div>
    		<script>
    		(function(){

    		    var fileInput = document.getElementById('video-input');
    		    var video = document.getElementById('video-container');

    		    document.getElementById('load-video').addEventListener('click', function(){

    		    	var fileUrl = window.URL.createObjectURL(fileInput.files[0]);

    		        video.src = fileUrl;

    		    });

    		})();   

			</script>
			
            <div id="question_text" align="left">
                Question Text</br>
                <textarea name="question_text" rows="6" cols="40"></textarea>
            </div>
            </br>
                
            <div id="fillin_attribute" align="left" >
                <div style="float:left">
                    <input type="checkbox" name="warningPattern" onclick="showWarningPatternAttribute(this)">WarningPattern</br>
                </div>
                </br>
                <div id="warningPattern_attribute" style="float:left;display:none; margin-left:60px;">
                    <select name="warning_type" size="1">
                        <option value="NumberWarningPattern" selected>FillIn</option>
                    </select>
                    Number Limits<input type="text" name="warningNumberLimit">
                </div>
                
                <div style="clear:both"></div>             
                <div style="float:left">
                    <input type="checkbox" name="regex" onclick="showRegexQuestionAttribute(this)">RegexQuestion</br>
                </div>
                <div id="regexQuestion_attribute" style="float:left;display: none; margin-left:60px;">
                    Input your Regex<input type="text" name="regexString">
                </div>
                <div style="clear:both"></div>
                
                <div style="float:left">
                    <input type="checkbox" name="number" onclick="showNumberQuestionAttribute(this)">NumberQuestion</br>
                </div>
                <div id="numberQuestion_attribute" style="float:left;display:none; margin-left:60px;">
                    Input your exact number<input type="text" name="NumberQuestion_ExactNumber">
                    Input your approximate<input type="text" name="NumberQuestion_Approximate">
                </div>
                 <div style="clear:both"></div>
            </div>
            
              <div id="essay_attribute" align="left" style= "display:none">
                <div>
                    Type your Essay</br>
               		<textarea name="essay_ques_text" rows="10" cols="100" onkeypress=" return check_length(this, document.getElementById('count_number_words'), document.getElementById('show_remaining_words'));"></textarea>
					<br>
					<font color="black">Word count:</font><font color="red"> 
  					<span id="count_number_words">0</span>
					</font>
					<br>
					<font color="black">Words remaining: </font><font color="red"> 
   					<span id="show_remaining_words">120</span>
					</font>

    
                </div>
            </div>
            
            <div id="multidropdown_attribute" align="left" style= "display:none">
                <div>
                
                    Multiple choice - Dropdown :
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; Correct Answer  
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
                    Add more options <input type="text" name="multichoice_dropdown_number" onchange="createDropDownChoices(this)" style="width: 30px;"  >
                    </br>
                   
                   </br> Option 1: <input type="text" name="dropdown_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" name="dropdown_choices" value ="choice_1" ></br>
                   </br> Option 2: <input type="text" name="dropdown_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" name="dropdown_choices" value ="choice_2" ></br>
                   </br> Option 3: <input type="text" name="dropdown_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" name="dropdown_choices" value ="choice_3" ></br>
                   </br> Option 4: <input type="text" name="dropdown_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" name="dropdown_choices" value ="choice_4" >
                
                   
                </div>
                
                <div id="dropdown"></div>
                
                
            </div>
            
            
            <div id="multiradio_attribute" align="left" style= "display:none">
                <div>
                    Multiple choice - Radio :
                    &nbsp;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; Correct Answer  
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
                    Add more options <input type="text" name="multichoice_radio_number" onchange="createRadioChoices(this)" style="width: 30px;"  >
                    </br>
                    <form>
                   </br> Option 1: <input type="text" name="radio_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" name="radio_choices" value ="choice_1" ></br>
                   </br> Option 2: <input type="text" name="radio_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" name="radio_choices" value ="choice_2" ></br>
                   </br> Option 3: <input type="text" name="radio_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" name="radio_choices" value ="choice_3" ></br>
                   </br> Option 4: <input type="text" name="radio_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="radio" name="radio_choices" value ="choice_4" >
                	</form>
                   
                </div>
                
                <div id="radio"></div>
          	</div>
            	
            
            <div id="multianswer_attribute" align="left" style= "display:none">
                <div>
                   Multiple Answer Choices:
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; &nbsp; &nbsp; Correct Answer  
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp; 
                    Add more options <input type="text" name="multianswer_number" onchange="createMultiChoices(this)" style="width: 30px;"   >
                    </br>
                    <form>
                   </br> Option 1: <input type="text" name="multi_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="checkbox" name="multi_choices" value ="choice_1" ></br>
                   </br> Option 2: <input type="text" name="multi_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="checkbox" name="multi_choices" value ="choice_2" ></br>
                   </br> Option 3: <input type="text" name="multi_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="checkbox" name="multi_choices" value ="choice_3" ></br>
                   </br> Option 4: <input type="text" name="multi_choices">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<input type="checkbox" name="multi_choices" value ="choice_4" >
                	</form>
                   
                </div>
                </br>
                
                <div id="multichoices"></div>
            </div>
            
            
            <div align="left">
            </br></br>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            
                    <input type="submit" value="Submit" size="12">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Cancel" size="12">
            </div>
        </form>
    </body>
</html>