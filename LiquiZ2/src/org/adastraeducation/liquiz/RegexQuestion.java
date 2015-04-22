package org.adastraeducation.liquiz;
import org.adastraeducation.liquiz.util.*;

import java.util.ArrayList;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Represent a single question with regex pattern for right answer
 * Yingzhu 
 */
public class RegexQuestion extends FillIn {	
	private Pattern pattern; // match to determine if correct
	private String warning; // sent to client so javascript can check if answer is in the right form
	
	public RegexQuestion() {
		// TODO Auto-generated constructor stub
	}
	
	public RegexQuestion(int id, int points, int level, String regex, String warning, boolean byName) {
		super(id,points,level,(ArrayList<Answer>) null);
		if (byName) {
			this.pattern = NamedObjects.getRegexPattern(regex);
		} else {
			this.pattern = Pattern.compile(regex);
		}
		this.warning = warning;
	}

	public void setPattern(String regex){
		this.pattern=Pattern.compile(regex);
	}
	
	public String getPattern(){
		return pattern.toString();
	}
	
	public void setWarning(String warning) {
		this.warning = warning;
	}
	
	public String getWarning() {
		return warning;
	}

	/*
	 * Returns true if regex pattern matches typed answer
	 */
	public double grade(String[] s) {
		Matcher m = pattern.matcher(s[0]);
		/*
		 * TODO: make sure there's nothing else in the answer: ^(red | white | blue)$
		 * A way to add them ourselves rather than depending on user to remember
		 * Warn teacher
		 */
		if(m.matches()) {
			return getPoints();
		}
		return 0;
	}
	
	//<input id='123' class='fillin' type='text' onblur='showWarningPattern(this, "\\d\\d\\d")'/> 
	public void writeHTML(StringBuilder b) {
		b.append("<input name='").append(getId()).append("' class='fillin' type='text' ");
		if(warning != null) {
			b.append("onblur='showWarningPattern(this, \"").append(Util.escapeRegex(warning)).append("\")'/>\n");
			b.append(" <div id=\"FW").append(this.getId()).append("\"");
		}
		b.append("/>\n");
	}
}
