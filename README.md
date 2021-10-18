# Sample Lightning Email Components

Note: this documentation is still a work in progress, please bear with us!

## Components
- **fixedAddress**: The simplest component one can create, this one simply places HTML in the email. My example was a hard-coded Company Address. No edits are possible by the person making the email.
- **fixedWithMergeFields**: Pretty much the same as above, but with a Merge Field added. Sadly you have to make adjustments to it, so for example instead of `{{{Recipient.FirstName}}}` you have to put in `{{{Recipient.FirstName&#125;&#125;&#125;` (has to do with LWC validating and compiling the curly braces for the LWC engine instead of just leaving it for email merging.
- **guidedManualEntry**: This one kicks it up 1 small step, where the Component allows the Email Editor to provide values (in my example it was a Title, Image URL, and a Description.  The unfortunate thing is that we can't specify a TextArea for input, so we are stuck with a single line input. BOOOO
- **starWarsCharacter**: This one uses an open API (https://swapi.dev) and should allow people to pick a Character, then the component will render details about that character in the email. There's something broken in the Lightning Builder though, and the DynamicPicklist approach isn't working...so this can't be fully shown off just yet.


## Other great examples:
These examples show additional ways that you can integrate external services to bring a real feature together. They both require a bit more setup (and they have instructions).
- [Video For Email Templates](https://github.com/shrej/email-video) -> From Salesforce Labs, this component allows you to place a video thumbnail with a play button overlay to an email template. What's really cool about this one is that it lets you pick from your Pardot Custom Redirects.
- [Go To Webinar Proof of Concept](https://github.com/jrattanpal/EmailBuilderPoC) -> A bit older of an example, though this one lets you choose from one of your Go To Webinars and it will place details directly into your email.