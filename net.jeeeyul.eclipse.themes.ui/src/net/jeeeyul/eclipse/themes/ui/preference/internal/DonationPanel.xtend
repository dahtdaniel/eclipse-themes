package net.jeeeyul.eclipse.themes.ui.preference.internal

import net.jeeeyul.eclipse.themes.SharedImages
import net.jeeeyul.swtend.SWTExtensions
import org.eclipse.swt.layout.GridLayout
import org.eclipse.swt.program.Program
import org.eclipse.swt.widgets.Composite
import org.eclipse.swt.widgets.Control
import org.eclipse.swt.widgets.Link

class DonationPanel {
	extension SWTExtensions = SWTExtensions.INSTANCE
	Control control

	new(Composite parent) {
		control = parent.newComposite [
			layout = new GridLayout(2, false)
			newLabel[image = SharedImages.getImage(SharedImages.ECLIPSE)]
			newLink[
				text = '''Don't forget to favorite this plugins on <a href="https://marketplace.eclipse.org/content/jeeeyuls-eclipse-themes">Market Place</a>.'''
			]
			newLabel[image = SharedImages.getImage(SharedImages.GITHUB)]
			newLink[
				text = '''You can fork and star this project on <a href="https://github.com/jeeeyul/eclipse-themes">GitHub</a>.'''
			]
			newLabel[image = SharedImages.getImage(SharedImages.PLEDGIE)]
			newLink[
				text = '''If you like this software, please consider a donation through <a href="https://pledgie.com/campaigns/18377">Pledgie</a>.'''
			]
			it.allContent.filter(typeof(Link)).forEach [
				onSelection = [
					Program.launch(text)
				]
			]
		]
	}

	def static void main(String[] args) {
		val extension SWTExtensions = SWTExtensions.INSTANCE
		newShell[
			layout = newGridLayout
			newPushButton[text = "a"]
			new DonationPanel(it) => [
				it.control.layoutData = FILL_HORIZONTAL
			]
			newPushButton[text = "b"]
		].openAndRunLoop
	}

}
