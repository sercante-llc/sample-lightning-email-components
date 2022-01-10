# Sample Lightning Email Components

Note: this documentation is still a work in progress, please bear with us!

- [Getting Started](#getting-started)
- [Components Included](#components-included)
- [Other great examples:](#other-great-examples-)

# Getting Started

1. Set up your local environment. Follow the steps in the [Quick Start: Lightning Web Components](https://trailhead.salesforce.com/content/learn/projects/quick-start-lightning-web-components/) Trailhead project. The steps include:

    - Enable Dev Hub in your Trailhead Playground
    - Install Salesforce CLI
    - Install Visual Studio Code
    - Install the Visual Studio Code Salesforce extensions
    - Getting familiar with a Lightning Web Component

1. Clone this repository:

    ```
    git clone https://github.com/sercante-llc/sample-lightning-email-components.git
    cd sample-lightning-email-components
    ```

## Installing the App using a Developer Edition Org or a Trailhead Playground via the Salesforce CLI

1. Authorize with your Trailhead Playground or Developer Edition org and provide it with an alias (**mydevorg** in the command below):

    ```
    sfdx auth:web:login -s -a mydevorg
    ```

1. Run this command in a terminal to deploy the app.

    ```
    sfdx force:source:deploy -p force-app
    ```

1. If your org isn't already open, open it now:

    ```
    sfdx force:org:open -u mydevorg
    ```

# Components Included
- **fixedAddress**: The simplest component one can create, this one simply places HTML in the email. My example was a hard-coded Company Address. No edits are possible by the person making the email.
- **fixedWithMergeFields**: Pretty much the same as above, but with a Merge Field added. Sadly you have to make adjustments to the merge field syntax, so for example instead of `{{{Recipient.FirstName}}}` you have to put in `{{{Recipient.FirstName&#125;&#125;&#125;` (has to do with LWC validating and compiling the curly braces for the LWC engine instead of just leaving it for email merging.
- **guidedManualEntry**: This one kicks it up 1 small step, where the Component allows the Email Editor to provide values (in my example it was a Title, Image URL, and a Description).  The unfortunate thing is that we can't specify a TextArea for input, so we are stuck with a single line input. BOOOO
- **htmlPicklist**: This one presents a dropdown choice of options. Once picked, the value should appear in the email. Hard coded options come from an APEX class, though these options could come from anywhere (SF records, APIs, etc)
- **starWarsCharacter**: This one uses an open API (https://swapi.dev) and allows people to pick a Character, then the component renders details about that character in the email. 

# Other great examples:
These examples show additional ways that you can integrate external services to bring a real feature together. They both require a bit more setup (and they have instructions).
- [Video For Email Templates](https://github.com/shrej/email-video) -> From Salesforce Labs, this component allows you to place a video thumbnail with a play button overlay to an email template. What's really cool about this one is that it lets you pick from your Pardot Custom Redirects.
- [Go To Webinar Proof of Concept](https://github.com/jrattanpal/EmailBuilderPoC) -> A bit older of an example, though this one lets you choose from one of your Go To Webinars and it will place details directly into your email.