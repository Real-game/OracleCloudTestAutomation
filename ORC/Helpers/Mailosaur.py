import datetime
# from datetime import datetime
from mailosaur import MailosaurClient
from mailosaur.models import SearchCriteria
import re


class Mailosaur(object):
    def __init__(self,api_key):
        self.client = MailosaurClient(api_key)

    def find_email(self, server_id, email_address):
        criteria = SearchCriteria()
        criteria.sent_to = email_address
        return self.client.messages.get(server_id, criteria)

    def find_email_by_subject(self, server_id, email_address, expected_subject):
        criteria = SearchCriteria()
        criteria.sent_to = email_address
        criteria.subject = expected_subject

        # message = self.client.messages.get(server_id, criteria)
        email = self.client.messages.get(server_id, criteria)

        # Loop through the emails and find one that matches the subject
        for email in email.items:
            print(f"Checking email with subject: {email.subject}")
            if email.subject == expected_subject:
                print(f"Found email with subject: {email.subject}")
                return email

        # If no matching email is found, return None
        print(f"No email found with subject: {expected_subject}")
        return None

    def subject_should_equal(self, message, expected):
        assert (message.subject == expected)

    def message_body(self, message):
        return message.html.body

    def get_otp_from_mail(self, message):
        # Print the full email body for debugging
        print(message.html.body)
        # Match any 6 consecutive digits (OTP) that might have surrounding characters
        match = re.search(r'(\d{6})', message.html.body)

        # Check if a match was found and return the matched group
        if match:
            otp = match.group(0)  # Get the matched OTP
            print(f"Extracted OTP: {otp}")  # Print the extracted OTP for debugging
            return otp
        else:
            print("No OTP found in the email body.")
            return None

    def get_html_second_links(self, message):
        # Passes if message has the expected number of links
        # assert (expected in len(message.html.links))
        print(len(message.html.links))
        # Accessing the HTML link content
        if len(message.html.links) > 1:
            link = message.html.links[1]  # Select the second link (index starts from 0)
            print(link.text)
            print(link.href)
            return link.href
        else:
            print("No link found at the desired index.")
            return None

    def get_html_link_by_text(self, message, link_text):
        # Check if the message has HTML content with links
        if hasattr(message.html, 'links') and len(message.html.links) > 0:
            # Iterate over all links in the message HTML content
            for link in message.html.links:
                # If the link text matches the desired text, return the link
                if link.text.strip() == link_text.strip():
                    print(f"Found link with text '{link_text}': {link.href}")
                    return link.href
            # If no matching link is found
            print(f"No link found with the text: {link_text}")
            return None
        else:
            print("No links found in the message HTML content.")
            return None

    def find_emails(self, server_id, email_address, expected_subject, received_after=None):
        criteria = SearchCriteria()
        criteria.sent_to = email_address
        criteria.subject = expected_subject
        if received_after is None:
            received_after = datetime.datetime.now() - datetime.timedelta(hours=24)
            print(received_after)

        message = self.client.messages.get(server_id, criteria, received_after=received_after)
        return message


# if __name__ == "__main__":
#     # Replace with your Mailosaur API Key and Server ID
#     api_key = "Oq6PqLtGnjVNpofTU0yYeowIm5EIwn78"
#     server_id = "7f7ddoox"
#     email_address = "mus-meal@7f7ddoox.mailosaur.net"  # Replace with the email address to check
#     Exped = "Your job offer for the Administrative Assistant, Office of the CCOs position!"
#
#     mailosaur = Mailosaur(api_key)
#
#     # Fetch the 2nd email in the mailbox (index = 1)
#     email = mailosaur.find_emails(server_id, email_address, Exped)
#     if email:
#         # Replace 'Click here' with the actual link text you're looking for
#         link_href = mailosaur.get_html_link_by_text(email, "Respond to Job Offer")
#         if link_href:
#             print(f"Link found: {link_href}")
#         else:
#             print("Link not found.")
#     else:
#         print("No email found.")
    # if email:
    #     # Check the subject
    #     print(f"Email found with subject: {email.subject}")
    #     # mailosaur.subject_should_equal(email, Exped)
    # else:
    #     print("No matching email found.")
    #     # Extract OTP from the email
    #     # otp = mailosaur.get_otp_from_mail(email)

        # Extract a link from the email
        # link = mailosaur.get_html_second_links(email)
        # print(link)

        # You can now use the `link` to navigate or perform actions

