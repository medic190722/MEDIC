package com.kh.medic.mail.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.Address;
import javax.mail.BodyPart;
import javax.mail.Folder;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Store;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMultipart;

import com.kh.medic.mail.model.vo.MailVo;

public class PostCan {

	public static List<MailVo> open() throws AddressException, MessagingException {

		ArrayList<MailVo> list = new ArrayList<>();

		Pattern SCRIPTS = Pattern.compile("<(no)?script[^>]*>.*?</(no)?script>", Pattern.DOTALL);
		Pattern STYLE = Pattern.compile("<style[^>]*>.*</style>", Pattern.DOTALL);
		Pattern TAGS = Pattern.compile("<(\"[^\"]*\"|\'[^\']*\'|[^\'\">])*>");
		Pattern nTAGS = Pattern.compile("<\\w+\\s+[^<]*\\s*>");
		Pattern ENTITY_REFS = Pattern.compile("&[^;]+;");
		Pattern WHITESPACE = Pattern.compile("\\s\\s+");

		String host = "pop.naver.com";

		final String username = "rlghvmffjqj"; // @naver.com 은 제외하고 아이디만.
		final String password = "z2067211";
		int port = 995;

		Properties props = System.getProperties();

		props.put("mail.pop3.host", host);
		props.put("mail.pop3.port", port);
		props.put("mail.pop3.auth", "true");
		props.put("mail.pop3.ssl.enable", "true");
		props.put("mail.pop3.ssl.trust", host);

		Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
			String un = username;
			String pw = password;

			protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
				return new javax.mail.PasswordAuthentication(un, pw);
			}
		});

		session.setDebug(false);
		Store store = session.getStore("pop3");
		store.connect();

		Folder folder = store.getFolder("INBOX");
		folder.open(Folder.READ_ONLY);

		Message[] messages = folder.getMessages();
		Matcher m;
		
		for (int i = 0, n = messages.length; i < n; i++) {
			Message message = messages[i];

			
//			  System.out.println(":::::::::::::::::::::::::::::::::::");
//			  System.out.println("Subject: " + message.getSubject());
//			  System.out.println("From: " + message.getFrom()[0]);
//			  System.out.println("Date: " + message.getHeader("Date")[0]);
			 // System.out.println("Body: " + message.getContent()); 
			
			 
			 
			MailVo mail = new MailVo();

			String content="";
			String body = "";
			try {
				
				if(message.getContent() instanceof MimeMultipart) {
					body = new PostCan().getTextFromMimeMultipart((MimeMultipart)message.getContent());
				} else {
					body = (String)message.getContent();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			Address[] froms = message.getFrom();
			String emailAdd = froms == null ? null : ((InternetAddress) froms[0]).getAddress();
			
			m = SCRIPTS.matcher(body);
			content=m.replaceAll("");
			m = STYLE.matcher(body);
			content=m.replaceAll("");
			m = TAGS.matcher(body);
			content=m.replaceAll("");
			m = ENTITY_REFS.matcher(body);
			content=m.replaceAll("");
			m = WHITESPACE.matcher(body);
			content=m.replaceAll("");
			
			mail.setMailContent(content);
			mail.setMailTitle(message.getSubject());
			mail.setMailDate(message.getHeader("Date")[0]);
			mail.setMailSender(emailAdd);

			list.add(mail);

		}

		store.close();

		return list;
	}

	private String getTextFromMimeMultipart(MimeMultipart mimeMultipart) throws MessagingException, IOException {
		String result = "";
		int count = mimeMultipart.getCount();
		for (int i = 0; i < count; i++) {
			BodyPart bodyPart = mimeMultipart.getBodyPart(i);
			if (bodyPart.isMimeType("text/plain")) {
				result = result + "\n" + bodyPart.getContent();
				break; // without break same text appears twice in my tests
			} else if (bodyPart.isMimeType("text/html")) {
				String html = (String) bodyPart.getContent();
				result = result + "\n" + org.jsoup.Jsoup.parse(html).text();
			} else if (bodyPart.getContent() instanceof MimeMultipart) {
				result = result + getTextFromMimeMultipart((MimeMultipart) bodyPart.getContent());
			}
		}
		return result;
	}
}