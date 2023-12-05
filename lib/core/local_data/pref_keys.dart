enum PrefsKeys {
  deviceToken,
  accessToken,
  appointments,
  invoices,
  doctors,
  systemStatuses,
  userProfile,
  appData,
  loginDataUser,
  listMedicalService,
  listPaymentMethod,
  listStatusPaymentMethod,
  listStatusAppointment,
  listStatusPayment,
  listDoctor,
  patients,
  patientRecords,
  paginationPatientRecords,
  paginationAppointmentsRecords,
  patientRecordSelectedLast,
  adminDashboard,
}

extension PrefsKeysExtension on PrefsKeys {
  String get value {
    switch (this) {
      case PrefsKeys.appData:
        return 'APP_DATA';
      case PrefsKeys.appointments:
        return 'APPOINTMENTS';
      case PrefsKeys.listMedicalService:
        return 'LIST_MEDICAL_SERVICES';
      case PrefsKeys.listPaymentMethod:
        return 'LIST_PAYMENT_METHOD';
      case PrefsKeys.listStatusAppointment:
        return 'LIST_STATUS_APPOINTMENT';
      case PrefsKeys.listStatusPayment:
        return 'LIST_STATUS_PAYMENT';
      case PrefsKeys.listDoctor:
        return 'LIST_DOCTOR';
      case PrefsKeys.userProfile:
        return 'USER_PROFILE';
      case PrefsKeys.systemStatuses:
        return 'SYSTEM_STATUSES';
      case PrefsKeys.deviceToken:
        return 'DEVICE_TOKEN';
      case PrefsKeys.accessToken:
        return 'ACCESS_TOKEN';
      case PrefsKeys.loginDataUser:
        return 'LOGIN_DATA_USER';
      case PrefsKeys.patients:
        return 'PATIENTS';
      case PrefsKeys.patientRecords:
        return 'PATIENT_RECORDS';
      case PrefsKeys.paginationPatientRecords:
        return 'PAGINATION_PATIENT_RECORDS';
      case PrefsKeys.paginationAppointmentsRecords:
        return 'PAGINATION_APPOINTMENTS_RECORDS';
      case PrefsKeys.patientRecordSelectedLast:
        return 'PATIENT_RECORDS_LAST_SELECTED';
      case PrefsKeys.adminDashboard:
        return 'ADMIN_DASHBOARD';
      default:
        return '';
    }
  }
}
