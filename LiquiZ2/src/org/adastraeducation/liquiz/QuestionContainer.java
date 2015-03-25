package org.adastraeducation.liquiz;
import java.util.ArrayList;
import java.util.Arrays;

public class QuestionContainer implements Displayable {
	private int id;
	private ArrayList<Displayable> displayables;

	public QuestionContainer() {
		displayables = new ArrayList<Displayable>();
	}
	public QuestionContainer(Displayable[] list) {
		displayables = new ArrayList<Displayable>(Arrays.asList(list));
	}
	public QuestionContainer(int id, Displayable[] list) {
		this.id = id;
		displayables = new ArrayList<Displayable>(Arrays.asList(list));
	}
	public ArrayList<Displayable> getDisplayables() {
		return this.displayables;
	}
	
	public void setDisplayables(ArrayList<Displayable> d){
		displayables = d;
	}
	
	public int getQuestionCount() {
		int count = 0;
		for (Displayable d : displayables) {
			if (d instanceof Question) {
				count++;
			}
		}
		return count;
	}

	public void add(Displayable d){
		displayables.add(d);
	}

	public void delete(Displayable d){
		displayables.remove(d);
	}

	public void writeHTML (StringBuilder b) {
		b.append("<div class='question'>\n");
		for (Displayable d : displayables) {
			d.writeHTML(b);
			//TODO: should there be a new line or a space separating each? 
			//should we create objects to represent spaces & newlines?
		}
		b.append("</div>\n");
	}

	public void writeXML (StringBuilder b) {
		b.append("<Q>");
		for (Displayable d : displayables) {
			d.writeXML(b);
		}
		b.append("</Q>");
	}

	public void writeJS (StringBuilder b) {
		b.append("{title: 'foo', className: 'claz' , content:[");
		if (displayables.size() > 0) {
			displayables.get(0).writeJS(b);
			if (displayables.size() > 1) {
				for (int i = 1; i < displayables.size(); i++) {
					b.append(',');
					displayables.get(i).writeJS(b);;
				}
			}
		}
		b.append("] };");
	}
}
