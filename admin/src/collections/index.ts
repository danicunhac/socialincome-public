import { EntityReference } from '@camberi/firecms';

export interface BuildCollectionProps {
	isGlobalAdmin: boolean;
	organisations?: EntityReference[];
}

export { adminsCollection } from './Admins';
export { contributionsCollection } from './Contributions';
export { contributorOrganisationsCollection } from './ContributorOrganisations';
export { newsletterSubscribersCollection } from './NewsletterSubscribers';
export { operationalExpensesCollection } from './OperationalExpenses';
export { orangeMoneyRecipientsCollection } from './OrangeMoneyRecipients';
export { buildPartnerOrganisationsCollection } from './PartnerOrganisations';
export { paymentsCollection } from './Payments';
export { buildRecentPaymentsCollection, buildRecipientsCollection } from './Recipients';
export { usersCollection } from './Users';
