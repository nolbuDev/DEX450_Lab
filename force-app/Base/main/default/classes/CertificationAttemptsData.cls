public without sharing class CertificationAttemptsData {
	public static Map<String, Certification_Attempt__c> loadTheData (Map<String, Contact> contacts, Map<String, Certification_Element__c> elements) {

		Map<String, Certification_Attempt__c> attempts = new Map<String, Certification_Attempt__c>{
			'ATTEMPT-00000' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,     Certification_Candidate__c=contacts.get('Delany').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00001' => new Certification_Attempt__c(STATUS__C='Complete/Fail',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Westbrook').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00002' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Westbrook').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00003' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Flynn').Id,      	Attempt_Date__c=System.today()),
			'ATTEMPT-00004' => new Certification_Attempt__c(STATUS__C='Complete/Fail',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Lambert').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00005' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Lambert').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00006' => new Certification_Attempt__c(STATUS__C='Complete/Fail',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Morgan').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00007' => new Certification_Attempt__c(STATUS__C='Complete/Fail',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Morgan').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00008' => new Certification_Attempt__c(STATUS__C='Complete/Fail',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Bean').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00009' => new Certification_Attempt__c(STATUS__C='Complete/Fail',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Bean').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00010' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Patil').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00011' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Lam1').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00012' => new Certification_Attempt__c(STATUS__C='Complete/Fail',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Lam1').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00013' => new Certification_Attempt__c(STATUS__C='Scheduled',           Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Abrams').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00014' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Nandani').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00015' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Morelli1').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00016' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Hamdun').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00017' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Torres').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00018' => new Certification_Attempt__c(STATUS__C='Scheduled',           Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Wagner1').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00019' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Dorey').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00020' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Yang').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00021' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Kurebayashi').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00022' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Parkinson').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00023' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Mehta').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00024' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Raman').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00025' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Meresman').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00026' => new Certification_Attempt__c(STATUS__C='Complete/Fail',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Cruz').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00027' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Cruz').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00028' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Gupta').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00029' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Hing').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00030' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Chandra').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00031' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Luo').Id,      Attempt_Date__c=System.today()),
			'ATTEMPT-00032' => new Certification_Attempt__c(STATUS__C='Complete/Pass',       Certification_Element__C=elements.get('AWCA Network Multiple Choice').Id,  Certification_Candidate__c=contacts.get('Peng').Id,      Attempt_Date__c=System.today())
		};

		insert attempts.values();
		
		return attempts;
	}

}
