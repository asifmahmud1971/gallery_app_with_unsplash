class TerminDetailsModel {
  TerminDetailsModel({
    this.id,
    this.campaignId,
    this.customerCompanyId,
    this.userId,
    this.prefixId,
    this.source,
    this.category,
    this.salutation,
    this.firstName,
    this.lastName,
    this.fullName,
    this.dateOfBirth,
    this.phoneNumber,
    this.phoneNumberIsoCode,
    this.fullPhoneNumber,
    this.email,
    this.street,
    this.houseNumber,
    this.zipCode,
    this.city,
    this.countryIsoCode,
    this.country,
    this.canton,
    this.region,
    this.otherLanguages,
    this.correspondenceLanguage,
    this.carInsurance,
    this.thirdPiller,
    this.householdGoods,
    this.legalProtection,
    this.healthStatus,
    this.contactPersonForInsuranceQuestions,
    this.healthInsurance,
    this.accident,
    this.franchise,
    this.supplementaryInsurance,
    this.save,
    this.lastHealthInsuranceChange,
    this.satisfaction,
    this.numberOfPersonsInHousehold,
    this.workActivity,
    this.desiredConsultationChannel,
    this.competition,
    this.originLink,
    this.contactDesired,
    this.lead,
    this.remarksControlLead,
    this.remarksControlAppointment,
    this.noInterestCount,
    this.notReachedCount,
    this.newNotReachedCount,
    this.dataVerifiedUpdated,
    this.residentialAddressConfirmed,
    this.contactRecordStatus,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.leadStatus,
    this.dueDate,
    this.ansprechspartner,
    this.optin,
    this.profession,
    this.tax,
    this.hypothek,
    this.healthInsurancePremiumMonthlyChf,
    this.annualMedicalExpenses,
    this.premiumPerYear,
    this.haveACredit,
    this.isEmployed,
    this.availabilityCount,
    this.allocation,
    this.campaign,
    this.creator,
    this.availability,
    this.appointments,
    this.intermediaryFeedback,
    this.lastFeedback,
    this.lastAppointment,
  });

  TerminDetailsModel.fromJson(dynamic json) {
    id = json['id'];
    campaignId = json['campaign_id'];
    customerCompanyId = json['customer_company_id'];
    userId = json['user_id'];
    prefixId = json['prefix_id'];
    source = json['source'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    salutation = json['salutation'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    dateOfBirth = json['date_of_birth'];
    phoneNumber = json['phone_number'];
    phoneNumberIsoCode = json['phone_number_iso_code'];
    fullPhoneNumber = json['full_phone_number'];
    email = json['email'];
    street = json['street'];
    houseNumber = json['house_number'];
    zipCode = json['zip_code'];
    city = json['city'];
    countryIsoCode = json['country_iso_code'];
    country = json['country'];
    canton = json['canton'];
    region = json['region'];
    otherLanguages = json['other_languages'] != null
        ? json['other_languages'].cast<String>()
        : [];
    correspondenceLanguage = json['correspondence_language'];
    carInsurance = json['car_insurance'];
    thirdPiller = json['third_piller'];
    householdGoods = json['household_goods'];
    legalProtection = json['legal_protection'];
    healthStatus = json['health_status'];
    contactPersonForInsuranceQuestions =
        json['contact_person_for_insurance_questions'];
    healthInsurance = json['health_insurance'];
    accident = json['accident'];
    franchise = json['franchise'];
    supplementaryInsurance = json['supplementary_insurance'];
    save = json['save'];
    lastHealthInsuranceChange = json['last_health_insurance_change'];
    satisfaction = json['satisfaction'];
    numberOfPersonsInHousehold = json['number_of_persons_in_household'];
    workActivity = json['work_activity'];
    desiredConsultationChannel = json['desired_consultation_channel'];
    competition = json['competition'];
    originLink = json['origin_link'];
    contactDesired = json['contact_desired'];
    lead = json['lead'];
    remarksControlLead = json['remarks_control_lead'];
    remarksControlAppointment = json['remarks_control_appointment'];
    noInterestCount = json['no_interest_count'];
    notReachedCount = json['not_reached_count'];
    newNotReachedCount = json['new_not_reached_count'];
    dataVerifiedUpdated = json['data_verified_updated'];
    residentialAddressConfirmed = json['residential_address_confirmed'];
    contactRecordStatus = json['contact_record_status'] != null
        ? ContactRecordStatus.fromJson(json['contact_record_status'])
        : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = json['deleted_at'];
    leadStatus = json['lead_status'];
    dueDate = json['due_date'];
    ansprechspartner = json['ansprechspartner'];
    optin = json['optin'];
    profession = json['profession'];
    tax = json['tax'];
    hypothek = json['hypothek'];
    healthInsurancePremiumMonthlyChf =
        json['health_insurance_premium_monthly_chf'];
    annualMedicalExpenses = json['annual_medical_expenses'];
    premiumPerYear = json['premium_per_year'];
    haveACredit = json['have_a_credit'];
    isEmployed = json['is_employed'];
    availabilityCount = json['availability_count'];
    allocation = json['allocation'] != null
        ? Allocation.fromJson(json['allocation'])
        : null;
    campaign =
        json['campaign'] != null ? Campaign.fromJson(json['campaign']) : null;
    creator =
        json['creator'] != null ? Creator.fromJson(json['creator']) : null;
    if (json['availability'] != null) {
      availability = [];
      json['availability'].forEach((v) {
        availability?.add(Availability.fromJson(v));
      });
    }
    if (json['appointments'] != null) {
      appointments = [];
      json['appointments'].forEach((v) {
        appointments?.add(Appointments.fromJson(v));
      });
    }
    intermediaryFeedback = json['intermediary_feedback'] != null
        ? IntermediaryFeedback.fromJson(json['intermediary_feedback'])
        : null;
    lastFeedback = json['last_feedback'] != null
        ? LastFeedback.fromJson(json['last_feedback'])
        : null;
    lastAppointment = json['last_appointment'] != null
        ? LastAppointment.fromJson(json['last_appointment'])
        : null;
  }

  int? id;
  int? campaignId;
  int? customerCompanyId;
  int? userId;
  String? prefixId;
  String? source;
  Category? category;
  String? salutation;
  String? firstName;
  String? lastName;
  dynamic fullName;
  String? dateOfBirth;
  String? phoneNumber;
  String? phoneNumberIsoCode;
  String? fullPhoneNumber;
  String? email;
  String? street;
  String? houseNumber;
  String? zipCode;
  String? city;
  String? countryIsoCode;
  String? country;
  String? canton;
  String? region;
  List<String>? otherLanguages;
  String? correspondenceLanguage;
  String? carInsurance;
  String? thirdPiller;
  String? householdGoods;
  String? legalProtection;
  String? healthStatus;
  String? contactPersonForInsuranceQuestions;
  String? healthInsurance;
  dynamic accident;
  dynamic franchise;
  dynamic supplementaryInsurance;
  String? save;
  String? lastHealthInsuranceChange;
  String? satisfaction;
  int? numberOfPersonsInHousehold;
  String? workActivity;
  String? desiredConsultationChannel;
  dynamic competition;
  dynamic originLink;
  String? contactDesired;
  String? lead;
  String? remarksControlLead;
  dynamic remarksControlAppointment;
  int? noInterestCount;
  int? notReachedCount;
  int? newNotReachedCount;
  bool? dataVerifiedUpdated;
  int? residentialAddressConfirmed;
  ContactRecordStatus? contactRecordStatus;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? leadStatus;
  dynamic dueDate;
  String? ansprechspartner;
  String? optin;
  String? profession;
  dynamic tax;
  dynamic hypothek;
  dynamic healthInsurancePremiumMonthlyChf;
  dynamic annualMedicalExpenses;
  dynamic premiumPerYear;
  int? haveACredit;
  int? isEmployed;
  int? availabilityCount;
  Allocation? allocation;
  Campaign? campaign;
  Creator? creator;
  List<Availability>? availability;
  List<Appointments>? appointments;
  IntermediaryFeedback? intermediaryFeedback;
  LastFeedback? lastFeedback;
  LastAppointment? lastAppointment;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['campaign_id'] = campaignId;
    map['customer_company_id'] = customerCompanyId;
    map['user_id'] = userId;
    map['prefix_id'] = prefixId;
    map['source'] = source;
    if (category != null) {
      map['category'] = category?.toJson();
    }
    map['salutation'] = salutation;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['full_name'] = fullName;
    map['date_of_birth'] = dateOfBirth;
    map['phone_number'] = phoneNumber;
    map['phone_number_iso_code'] = phoneNumberIsoCode;
    map['full_phone_number'] = fullPhoneNumber;
    map['email'] = email;
    map['street'] = street;
    map['house_number'] = houseNumber;
    map['zip_code'] = zipCode;
    map['city'] = city;
    map['country_iso_code'] = countryIsoCode;
    map['country'] = country;
    map['canton'] = canton;
    map['region'] = region;
    map['other_languages'] = otherLanguages;
    map['correspondence_language'] = correspondenceLanguage;
    map['car_insurance'] = carInsurance;
    map['third_piller'] = thirdPiller;
    map['household_goods'] = householdGoods;
    map['legal_protection'] = legalProtection;
    map['health_status'] = healthStatus;
    map['contact_person_for_insurance_questions'] =
        contactPersonForInsuranceQuestions;
    map['health_insurance'] = healthInsurance;
    map['accident'] = accident;
    map['franchise'] = franchise;
    map['supplementary_insurance'] = supplementaryInsurance;
    map['save'] = save;
    map['last_health_insurance_change'] = lastHealthInsuranceChange;
    map['satisfaction'] = satisfaction;
    map['number_of_persons_in_household'] = numberOfPersonsInHousehold;
    map['work_activity'] = workActivity;
    map['desired_consultation_channel'] = desiredConsultationChannel;
    map['competition'] = competition;
    map['origin_link'] = originLink;
    map['contact_desired'] = contactDesired;
    map['lead'] = lead;
    map['remarks_control_lead'] = remarksControlLead;
    map['remarks_control_appointment'] = remarksControlAppointment;
    map['no_interest_count'] = noInterestCount;
    map['not_reached_count'] = notReachedCount;
    map['new_not_reached_count'] = newNotReachedCount;
    map['data_verified_updated'] = dataVerifiedUpdated;
    map['residential_address_confirmed'] = residentialAddressConfirmed;
    if (contactRecordStatus != null) {
      map['contact_record_status'] = contactRecordStatus?.toJson();
    }
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['deleted_at'] = deletedAt;
    map['lead_status'] = leadStatus;
    map['due_date'] = dueDate;
    map['ansprechspartner'] = ansprechspartner;
    map['optin'] = optin;
    map['profession'] = profession;
    map['tax'] = tax;
    map['hypothek'] = hypothek;
    map['health_insurance_premium_monthly_chf'] =
        healthInsurancePremiumMonthlyChf;
    map['annual_medical_expenses'] = annualMedicalExpenses;
    map['premium_per_year'] = premiumPerYear;
    map['have_a_credit'] = haveACredit;
    map['is_employed'] = isEmployed;
    map['availability_count'] = availabilityCount;
    if (allocation != null) {
      map['allocation'] = allocation?.toJson();
    }
    if (campaign != null) {
      map['campaign'] = campaign?.toJson();
    }
    if (creator != null) {
      map['creator'] = creator?.toJson();
    }
    if (availability != null) {
      map['availability'] = availability?.map((v) => v.toJson()).toList();
    }
    if (appointments != null) {
      map['appointments'] = appointments?.map((v) => v.toJson()).toList();
    }
    if (intermediaryFeedback != null) {
      map['intermediary_feedback'] = intermediaryFeedback?.toJson();
    }
    if (lastFeedback != null) {
      map['last_feedback'] = lastFeedback?.toJson();
    }
    if (lastAppointment != null) {
      map['last_appointment'] = lastAppointment?.toJson();
    }
    return map;
  }
}

class LastAppointment {
  LastAppointment({
    this.id,
    this.prefixId,
    this.customerCompanyId,
    this.contactDataRecordId,
    this.userId,
    this.appointmentDate,
    this.appointmentTime,
    this.notes,
    this.controlStatusAppointment,
    this.appointmentControlTask,
    this.appointmentControlTaskRemarks,
    this.appointmentControlTaskStatus,
    this.appointmentReminderStatus,
    this.appointmentReminderRemarks,
    this.appointmentDateTime,
    this.createdAt,
    this.updatedAt,
  });

  LastAppointment.fromJson(dynamic json) {
    id = json['id'];
    prefixId = json['prefix_id'];
    customerCompanyId = json['customer_company_id'];
    contactDataRecordId = json['contact_data_record_id'];
    userId = json['user_id'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    notes = json['notes'];
    controlStatusAppointment = json['control_status_appointment'];
    appointmentControlTask = json['appointment_control_task'];
    appointmentControlTaskRemarks = json['appointment_control_task_remarks'];
    appointmentControlTaskStatus = json['appointment_control_task_status'];
    appointmentReminderStatus = json['appointment_reminder_status'];
    appointmentReminderRemarks = json['appointment_reminder_remarks'];
    appointmentDateTime = json['appointment_date_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? prefixId;
  int? customerCompanyId;
  int? contactDataRecordId;
  int? userId;
  String? appointmentDate;
  String? appointmentTime;
  String? notes;
  String? controlStatusAppointment;
  String? appointmentControlTask;
  String? appointmentControlTaskRemarks;
  int? appointmentControlTaskStatus;
  dynamic appointmentReminderStatus;
  dynamic appointmentReminderRemarks;
  String? createdAt;
  String? updatedAt;
  String? appointmentDateTime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['prefix_id'] = prefixId;
    map['customer_company_id'] = customerCompanyId;
    map['contact_data_record_id'] = contactDataRecordId;
    map['user_id'] = userId;
    map['appointment_date'] = appointmentDate;
    map['appointment_time'] = appointmentTime;
    map['notes'] = notes;
    map['control_status_appointment'] = controlStatusAppointment;
    map['appointment_control_task'] = appointmentControlTask;
    map['appointment_control_task_remarks'] = appointmentControlTaskRemarks;
    map['appointment_control_task_status'] = appointmentControlTaskStatus;
    map['appointment_reminder_status'] = appointmentReminderStatus;
    map['appointment_date_time'] = appointmentDateTime;
    map['appointment_reminder_remarks'] = appointmentReminderRemarks;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class ContactRecordStatus {
  ContactRecordStatus({
    this.label,
    this.value,
  });

  ContactRecordStatus.fromJson(dynamic json) {
    label = json['label'];
    value = json['value'];
  }
  String? label;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['value'] = value;
    return map;
  }
}

class LastFeedback {
  LastFeedback({
    this.id,
    this.contactDataRecordId,
    this.feedback,
    this.feedbackRemarks,
    this.callDate,
    this.callTime,
    this.createdAt,
    this.updatedAt,
  });

  LastFeedback.fromJson(dynamic json) {
    id = json['id'];
    contactDataRecordId = json['contact_data_record_id'];
    feedback = json['feedback'];
    feedbackRemarks = json['feedback_remarks'];
    callDate = json['call_date'];
    callTime = json['call_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  int? contactDataRecordId;
  String? feedback;
  dynamic feedbackRemarks;
  String? callDate;
  String? callTime;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['contact_data_record_id'] = contactDataRecordId;
    map['feedback'] = feedback;
    map['feedback_remarks'] = feedbackRemarks;
    map['call_date'] = callDate;
    map['call_time'] = callTime;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class IntermediaryFeedback {
  IntermediaryFeedback({
    this.id,
    this.contactDataRecordId,
    this.appointmentTookPlace,
    this.outcome,
    this.contractsConcluded,
    this.intermediaryRemarks,
    this.reason,
    this.other,
    this.expiryYear,
    this.followUpContactDate,
    this.followUpContactTime,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  IntermediaryFeedback.fromJson(dynamic json) {
    id = json['id'];
    contactDataRecordId = json['contact_data_record_id'];
    appointmentTookPlace = json['appointment_took_place'];
    outcome =
        json['outcome'] != null ? Outcome.fromJson(json['outcome']) : null;
    contractsConcluded = json['contracts_concluded'];
    intermediaryRemarks = json['intermediary_remarks'];
    reason = json['reason'] != null ? Reason.fromJson(json['reason']) : null;
    other = json['other'];
    expiryYear = json['expiry_year'];
    followUpContactDate = json['follow_up_contact_date'];
    followUpContactTime = json['follow_up_contact_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(DetailsImages.fromJson(v));
      });
    }
  }

  int? id;
  int? contactDataRecordId;
  int? appointmentTookPlace;
  Outcome? outcome;
  int? contractsConcluded;
  String? intermediaryRemarks;
  Reason? reason;
  dynamic other;
  dynamic expiryYear;
  dynamic followUpContactDate;
  dynamic followUpContactTime;
  String? createdAt;
  String? updatedAt;

  List<DetailsImages>? images;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['contact_data_record_id'] = contactDataRecordId;
    map['appointment_took_place'] = appointmentTookPlace;
    if (outcome != null) {
      map['outcome'] = outcome?.toJson();
    }
    map['contracts_concluded'] = contractsConcluded;
    map['intermediary_remarks'] = intermediaryRemarks;
    if (reason != null) {
      map['reason'] = reason?.toJson();
    }
    map['other'] = other;
    map['expiry_year'] = expiryYear;
    map['follow_up_contact_date'] = followUpContactDate;
    map['follow_up_contact_time'] = followUpContactTime;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class DetailsImages {
  DetailsImages({
    this.id,
    this.contactDataRecordIntermediaryFeedbackId,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
    this.imageUrl,
  });

  DetailsImages.fromJson(dynamic json) {
    id = json['id'];
    contactDataRecordIntermediaryFeedbackId =
        json['contact_data_record_intermediary_feedback_id'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    imageUrl = json['image_url'];
  }
  int? id;
  int? contactDataRecordIntermediaryFeedbackId;
  String? imagePath;
  String? createdAt;
  String? updatedAt;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['contact_data_record_intermediary_feedback_id'] =
        contactDataRecordIntermediaryFeedbackId;
    map['image_path'] = imagePath;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['image_url'] = imageUrl;
    return map;
  }
}

class Reason {
  Reason({
    this.label,
    this.value,
  });

  Reason.fromJson(dynamic json) {
    label = json['label'];
    value = json['value'];
  }
  String? label;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['value'] = value;
    return map;
  }
}

class Outcome {
  Outcome({
    this.label,
    this.value,
  });

  Outcome.fromJson(dynamic json) {
    label = json['label'];
    value = json['value'];
  }
  String? label;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['value'] = value;
    return map;
  }
}

class Category {
  Category({
    this.label,
    this.value,
  });

  Category.fromJson(dynamic json) {
    label = json['label'];
    value = json['value'];
  }
  String? label;
  String? value;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['label'] = label;
    map['value'] = value;
    return map;
  }
}

class Appointments {
  Appointments({
    this.id,
    this.prefixId,
    this.customerCompanyId,
    this.contactDataRecordId,
    this.userId,
    this.appointmentDate,
    this.appointmentTime,
    this.notes,
    this.controlStatusAppointment,
    this.appointmentControlTask,
    this.appointmentControlTaskRemarks,
    this.appointmentControlTaskStatus,
    this.appointmentReminderStatus,
    this.appointmentReminderRemarks,
    this.createdAt,
    this.updatedAt,
  });

  Appointments.fromJson(dynamic json) {
    id = json['id'];
    prefixId = json['prefix_id'];
    customerCompanyId = json['customer_company_id'];
    contactDataRecordId = json['contact_data_record_id'];
    userId = json['user_id'];
    appointmentDate = json['appointment_date'];
    appointmentTime = json['appointment_time'];
    notes = json['notes'];
    controlStatusAppointment = json['control_status_appointment'];
    appointmentControlTask = json['appointment_control_task'];
    appointmentControlTaskRemarks = json['appointment_control_task_remarks'];
    appointmentControlTaskStatus = json['appointment_control_task_status'];
    appointmentReminderStatus = json['appointment_reminder_status'];
    appointmentReminderRemarks = json['appointment_reminder_remarks'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? prefixId;
  int? customerCompanyId;
  int? contactDataRecordId;
  int? userId;
  String? appointmentDate;
  String? appointmentTime;
  String? notes;
  String? controlStatusAppointment;
  String? appointmentControlTask;
  String? appointmentControlTaskRemarks;
  int? appointmentControlTaskStatus;
  dynamic appointmentReminderStatus;
  dynamic appointmentReminderRemarks;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['prefix_id'] = prefixId;
    map['customer_company_id'] = customerCompanyId;
    map['contact_data_record_id'] = contactDataRecordId;
    map['user_id'] = userId;
    map['appointment_date'] = appointmentDate;
    map['appointment_time'] = appointmentTime;
    map['notes'] = notes;
    map['control_status_appointment'] = controlStatusAppointment;
    map['appointment_control_task'] = appointmentControlTask;
    map['appointment_control_task_remarks'] = appointmentControlTaskRemarks;
    map['appointment_control_task_status'] = appointmentControlTaskStatus;
    map['appointment_reminder_status'] = appointmentReminderStatus;
    map['appointment_reminder_remarks'] = appointmentReminderRemarks;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Availability {
  Availability({
    this.id,
    this.contactDataRecordId,
    this.day,
    this.firstStartTime,
    this.firstEndTime,
    this.lastStartTime,
    this.lastEndTime,
    this.createdAt,
    this.updatedAt,
  });

  Availability.fromJson(dynamic json) {
    id = json['id'];
    contactDataRecordId = json['contact_data_record_id'];
    day = json['day'];
    firstStartTime = json['first_start_time'];
    firstEndTime = json['first_end_time'];
    lastStartTime = json['last_start_time'];
    lastEndTime = json['last_end_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  int? contactDataRecordId;
  String? day;
  String? firstStartTime;
  String? firstEndTime;
  String? lastStartTime;
  String? lastEndTime;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['contact_data_record_id'] = contactDataRecordId;
    map['day'] = day;
    map['first_start_time'] = firstStartTime;
    map['first_end_time'] = firstEndTime;
    map['last_start_time'] = lastStartTime;
    map['last_end_time'] = lastEndTime;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Creator {
  Creator({
    this.id,
    this.fullName,
  });

  Creator.fromJson(dynamic json) {
    id = json['id'];
    fullName = json['full_name'];
  }
  int? id;
  String? fullName;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['full_name'] = fullName;
    return map;
  }
}

class Campaign {
  Campaign({
    this.id,
    this.prefixId,
    this.name,
    this.status,
    this.createdAt,
    this.updatedAt,
  });

  Campaign.fromJson(dynamic json) {
    id = json['id'];
    prefixId = json['prefix_id'];
    name = json['name'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
  int? id;
  String? prefixId;
  String? name;
  String? status;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['prefix_id'] = prefixId;
    map['name'] = name;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}

class Allocation {
  Allocation({
    this.id,
    this.prefixId,
    this.allocateByUserId,
    this.customerCompanyId,
    this.contactDataRecordId,
    this.userId,
    this.brokerUserId,
    this.internalUserId,
    this.organizationElementId,
    this.brokerId,
    this.campaignId,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.user,
  });

  Allocation.fromJson(dynamic json) {
    id = json['id'];
    prefixId = json['prefix_id'];
    allocateByUserId = json['allocate_by_user_id'];
    customerCompanyId = json['customer_company_id'];
    contactDataRecordId = json['contact_data_record_id'];
    userId = json['user_id'];
    brokerUserId = json['broker_user_id'];
    internalUserId = json['internal_user_id'];
    organizationElementId = json['organization_element_id'];
    brokerId = json['broker_id'];
    campaignId = json['campaign_id'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  int? id;
  dynamic prefixId;
  int? allocateByUserId;
  int? customerCompanyId;
  int? contactDataRecordId;
  int? userId;
  int? brokerUserId;
  dynamic internalUserId;
  dynamic organizationElementId;
  dynamic brokerId;
  dynamic campaignId;
  String? type;
  String? createdAt;
  String? updatedAt;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['prefix_id'] = prefixId;
    map['allocate_by_user_id'] = allocateByUserId;
    map['customer_company_id'] = customerCompanyId;
    map['contact_data_record_id'] = contactDataRecordId;
    map['user_id'] = userId;
    map['broker_user_id'] = brokerUserId;
    map['internal_user_id'] = internalUserId;
    map['organization_element_id'] = organizationElementId;
    map['broker_id'] = brokerId;
    map['campaign_id'] = campaignId;
    map['type'] = type;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.id,
    this.languageId,
    this.photo,
    this.firstName,
    this.lastName,
    this.fullName,
    this.email,
    this.customerCompanyId,
    this.emailVerifiedAt,
    this.type,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.sendMail,
    this.verificationToken,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    languageId = json['language_id'];
    photo = json['photo'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    customerCompanyId = json['customer_company_id'];
    emailVerifiedAt = json['email_verified_at'];
    type = json['type'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    sendMail = json['send_mail'];
    verificationToken = json['verification_token'];
  }
  int? id;
  int? languageId;
  dynamic photo;
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  int? customerCompanyId;
  String? emailVerifiedAt;
  String? type;
  String? status;
  String? createdAt;
  String? updatedAt;
  int? sendMail;
  dynamic verificationToken;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['language_id'] = languageId;
    map['photo'] = photo;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['full_name'] = fullName;
    map['email'] = email;
    map['customer_company_id'] = customerCompanyId;
    map['email_verified_at'] = emailVerifiedAt;
    map['type'] = type;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['send_mail'] = sendMail;
    map['verification_token'] = verificationToken;
    return map;
  }
}
