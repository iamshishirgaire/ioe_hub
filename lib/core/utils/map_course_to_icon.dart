String? mapCourseToIcon(String course) {
  switch (course) {
    case 'civil':
      return 'assets/icons/civil.svg';
    case 'industrial':
      return 'assets/icons/industrial.svg';
    case 'computer':
      return 'assets/icons/computer.svg';
    case 'architecture':
      return 'assets/icons/architecture.svg';
    case 'electronics_new':
      return 'assets/icons/electronics_new.svg';
    case 'electronics':
      return 'assets/icons/electronics.svg';
    case 'electrical':
      return 'assets/icons/electrical.svg';
    case 'automobile':
      return 'assets/icons/automobile.svg';
    case 'aerospace':
      return 'assets/icons/aerospace.svg';
    case 'agriculture':
      return 'assets/icons/agriculture.svg';
    case 'mechanical':
      return 'assets/icons/mechanical.svg';
    case 'geomatics':
      return 'assets/icons/geomatics.svg';

    default:
      return null;
  }
}
