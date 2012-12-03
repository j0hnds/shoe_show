json.id         coordinator.id
json.first_name coordinator.first_name
json.last_name  coordinator.last_name
json.work_phone coordinator.phones.first.present? ? coordinator.phones.first.phone_number : nil
json.email      coordinator.contact_info.email
